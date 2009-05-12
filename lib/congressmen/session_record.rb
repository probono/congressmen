module Congressmen

  I_LEGISLATURE = 1979..1982
  II_LEGISLATURE = 1982..1986
  III_LEGISLATURE = 1986..1989
  IV_LEGISLATURE = 1989..1993
  V_LEGISLATURE = 1993..1995
  VI_LEGISLATURE = 1996..1999
  VII_LEGISLATURE = 2000..2003
  VIII_LEGISLATURE = 2004..2007
  IX_LEGISLATURE = 2008..2011

  class SessionRecord
    attr_accessor :pages, :actors, :date, :number
    
    def initialize
      @pages = []
      @actors = []
    end
    
    def add_page(text)
      Congressmen::SessionRecordPage.new(self, text).tap do |p|
        pages << p
        puts "Pag. #{p.number} -------------------------"
      end
    end
    
  end
  class SessionRecordPage
    attr_accessor :record, :number, :text
    
    def initialize(record, text)
      @record = record
      @original_text = text
      @text = clean_text(text)
      analyze
    end
    private
    def clean_text(text)
      text.gsub!(/(.)-(.)/,'\1\2')
      text.gsub!(/(.)\.(.)/,'\1. \2')
      text.squeeze!(" ")
      text.strip!
    end
    def analyze
      data = text.scan(/CONGRESO(.*). –NÚM. (.*)— (.*)—/).flatten
      if data
        #Date.strptime('28/03/2008', '%d/%m/%Y')
        
        record.date ||= data[0]
        puts record.date
        record.number ||= data[1]
        self.number = data[2]
      end
    end
  end
  
  
end