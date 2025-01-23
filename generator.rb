require 'prawn'


def collect_data
    puts "Welcome to the resume generator!"
    puts "Enter your details to generate your resume"

    data = {}

    print "Type a Full Name: "
    data[:name] = gets.chomp
    
    print "Your professional email: "
    data[:email] = gets.chomp
    
    print "Enter your phone: "
    data[:phone] = gets.chomp

    print "The URL of your LinkedIn profile: "
    data[:linkedin] = gets.chomp

    data[:experiences] = []
    puts "Add your work experiences (leave blank to finish):"

    loop do
        print "Job title: "
        title = gets.chomp
        break if title.empty?

        print "Company: "
        company = gets.chomp

        print "Description: "
        description = gets.chomp

        data[:experiences] << {title: title, company: company, description: description}
    end

    data[:skills] = []
    puts "Add your skills (leave blank to finish):"
    loop do
        print "Skill: "
        skill = gets.chomp
        break if skill.empty?

        data[:skills] << skill
    end

    data
end
