class Datum < ActiveRecord::Base

	validates_presence_of :firstname
	validates_presence_of :lastname

end