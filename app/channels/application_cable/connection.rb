module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :allowed

    def connect
      self.allowed = true
    end
  end
end
