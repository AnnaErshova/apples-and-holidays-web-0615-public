def second_supply_for_fourth_of_july(holiday_hash)
  # data structure = {seasons} => {holidays} => [supplies]
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above 
  # add the second argument, which is a supply, to either the
  # Christmas or the New Year's arrays -- the prompt should really be to BOTH? according to rspec at least

  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply
  # can push into supplies because supplies are an array
end

def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array # adding new key
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  # has all the winter supplies (Lights, Wreath, Party Hats)
  holiday_hash[:winter].values.flatten
  # holiday.hash[:winter]. collect do |holiday, supplies|
  #    supplies #=> ["Lights","Wreath"]
  # end.flatten
end

# should output the formatted list of holidays and their supplies
# first, iterate through the keys of holiday_hash to get to seasons
# then, within that, iterate through the keys of seasons to get to holidays
# then, within that, iterate through the holidays to get to supplies
# convert the outcome to separate words in strings where all words are capitalized
# interestingly, I refer to 'holiday' more than once, but that still works. I guess it is an object_id situation again with object_ids are still different
def all_supplies_in_holidays(holiday_hash)
  holiday_hash.keys.each do |season|
    puts "#{season.capitalize}:"
    holiday_hash[season].each do |holiday, supply|
      supplies = supply.join(", ")
      puts "  #{holiday.to_s.gsub("_"," ").split.map(&:capitalize).join(' ')}: #{supplies}"
      # thank you, Stack Overflow! I have no real idea what &:capitalize does yet...
      # is there a way to replace a letter with a capitalized letter? 

      # or use collect/map as they will retrun modified versions of the array
      # normalzied_holiday_name = holiday.to_s.split("_")
      # collect {|w| w.capitalize}
      # join(" ")
      # puts " formatted output"
    end
  end
end


def all_holidays_with_bbq(holiday_hash)
    outcome_array = [] # initializes empty array into which results will be pushed once filtered
    holiday_hash.each {|season, holiday| holiday.each { |holiday, supply| outcome_array << holiday if supply.include? ("BBQ")}}
    outcome_array # calls on the array which now has filtered content
end
# what really tripped me up here was using == instead of include because I did not realize the outcome would be arrays not strings

# More alternative code:
# def all_holidays_with_bbq(holiday_hash)
#    holiday_hash.collect do |season, holidays|
#      holidays.select do |holiday_name, supplies|
#        supplies.include? ("BBQ")
#      end.keys
#    end.flatten
# end

# Version from the lecture -- does not work?
# holiday_hash.collect do |season,holidays|
#     holidays.select do |holiday_name, supplies|
#        holiday_name if supplies.include? ("BBQ")
#        end
#     end
# end


 