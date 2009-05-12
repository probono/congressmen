require 'rubygems'
require 'pdf/reader'

require 'congressmen/parser'
require 'congressmen/session_record'
require 'congressmen/actor'

# backport of 1.9
class Object
  def tap
    yield self
    self
  end
end unless Object.respond_to? :tap
