def Congressmen(file, opts = {})
  Congressmen.parse(file, opts)
end

module Congressmen
  
  def Congressmen.parse(file, opts = {})
    receiver = PDFScanner.new(Congressmen::SessionRecord.new)
    pdf =  PDF::Reader.file(file, receiver) 
    receiver.doc
  end
  
end


class PDFScanner
  attr_accessor :doc

  def initialize(doc)
    @doc = doc
  end

  # Called when page parsing starts
  def begin_page(arg = nil)
    @current_page = ""
  end
  
  def end_page
    doc.add_page(@current_page)
    puts doc.pages.last.text + "\n\n\n\n\n"
  end
  # record text that is drawn on the page
  def show_text(string, *params)
    @current_page << string
  end

  def end_text_object
    @current_page << " " 
  end
  
  def move_to_start_of_next_line
    @current_page << " " 
  end
  def set_character_spacing(string)
    @current_page << " "
  end

  # there's a few text callbacks, so make sure we process them all
  alias :super_show_text :show_text
  alias :move_to_next_line_and_show_text :show_text
  alias :set_spacing_next_line_show_text :show_text

  # this final text callback takes slightly different arguments
  def show_text_with_positioning(*params)
    params = params.first
    params.each { |str| show_text(str) if str.kind_of?(String)}
  end
end