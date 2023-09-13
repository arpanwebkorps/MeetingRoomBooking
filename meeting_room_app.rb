# frozen_string_literal: true

name_regex = /\A[A-Za-z\s]+\z/
age_regex = /\A\d+\z/
email_regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
num_regex = /^(0|[1-9]\d*)$/

# This is class for Meeting Room Booking app
class MeetingRoomBooking
  def initialize
    @hash = {}
  end

  def booking_slot(slot, name, disease, age, email)
    if @hash.key?(slot)
      puts "Slot #{slot} is booked"
    else
      @hash[slot] = { name: name, disease: disease, age: age, email: email }
      puts name
      puts "Slot #{slot} is booked by #{@hash[slot][:name]}"
    end
  end

  def view_all_slots
    if @hash.empty?
      puts 'All the Slots is Empty...!'
    else
      puts(@hash.each_pair { |key, value| puts "#{key} = #{value}" })
    end
  end

  def delete_slots(slot)
    if @hash.key?(slot)
      @hash.delete(slot)
      puts "slot #{slot} is not Deleted"
    else
      puts "slot #{slot} is not available"
    end
  end

  def booking_details(slot)
    if @hash.include?(slot)
      @hash[slot].each_pair { |key, value| puts "#{key} = #{value}" }
    else
      puts "slot #{slot} is not available"
    end
  end

  def remove_patient_slot(slot)
    if @hash.include?(slot)
      @hash[slot].clear
      puts "#{slot} patient is removed"
    else
      puts "slot #{slot} is not available"
    end
  end
end

object_booking_app = MeetingRoomBooking.new
def check_validation(enter, regex, show_error)
  loop do
    puts enter
    choice = gets.chomp
    return choice if choice.match?(regex)

    puts show_error
  end
end

puts '1. Book Slot'
puts '2. View All Slots'
puts '3. Delete Slot'
puts '4. View Booking Details'
puts '0. Exit'

loop do
  choice = check_validation('Enter your choice : ', num_regex, 'Enter valid choice')
  case choice.to_i
  when 1
    slot = check_validation('Enter slot number : ', num_regex, 'Enter valid slot number')
    name = check_validation('Enter Name : ', name_regex, 'Enter valid Name')
    disease = check_validation('Enter Disease Name : ', name_regex, 'Enter valid Disease Name')
    age = check_validation('Enter slot Age : ', age_regex, 'Enter valid Age')
    email = check_validation('Enter Email : ', email_regex, 'Enter valid Email')
    object_booking_app.booking_slot(slot, name, disease, age, email)
  when 2
    object_booking_app.view_all_slots
  when 3
    slot = check_validation('Enter slot number to delete: ', num_regex, 'Enter valid slot for delete')
    object_booking_app.delete_slots(slot)
  when 4
    slot = check_validation('Enter slot number for booking details: ', num_regex, 'Enter valid slot booking details')
    object_booking_app.booking_details(slot)
  when 0
    puts 'Exiting...'
    break
  else
    puts 'Invalid choice!'
  end
end
