require 'nokogiri'
require 'faraday'
require 'faraday-cookie_jar'
require 'logger'

class DocValidator
  def self.validate(doc_type, run, doc_number)
    url = 'https://portal.sidiv.registrocivil.cl'

    logger = Logger.new $stderr
    logger.level = Logger::ERROR

    conn = Faraday.new(url: url, ssl: { verify: false }) do |faraday|
      faraday.use :cookie_jar
      faraday.request  :url_encoded # form-encode POST params
      # faraday.response :logger                  # log requests to $stdout
      faraday.response :logger, logger
      faraday.adapter  Faraday.default_adapter # make requests with Net::HTTP
    end

    res = conn.get do |req|
      req.url '/usuarios-portal/pages/DocumentRequestStatus.xhtml'
      req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
      req.headers['User-Agent'] = 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36'
    end

    doc = Nokogiri::HTML(res.body)
    view_state = doc.css("input[id='javax.faces.ViewState']")[0]['value']
    # run = '18451636-5'
    # {CEDULA,CEDULA_EXT,PASAPORTE_PG,PASAPORTE_DIPLOMATICO,PASAPORTE_OFICIAL}
    # doc_type = 'CEDULA'
    # https://www.srcei.cl/PortalSIDIV/ayuda_documento.html
    # doc_number = '109423012'

    params = {
      'form' => 'form',
      'form:run' => run,
      'form:selectDocType' => doc_type,
      'form:docNumber' => doc_number,
      'form:buttonHidden' => '',
      'javax.faces.ViewState' => view_state
    }

    res = conn.post do |req|
      req.url '/usuarios-portal/pages/DocumentRequestStatus.xhtml'
      req.params = params
      req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
      req.headers['User-Agent'] = 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36'
    end

    doc = Nokogiri::HTML(res.body)
    doc.css('#tableResult').xpath('//tbody/tr/td')[1].text
  rescue StandardError
    'Error'
  end
end
