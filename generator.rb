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

    puts "Add your work experiences (leave blank to finish):"
    data[:summary] = gets.chomp
    
    data[:experiences] = []

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
    
    print "Now choose a name for your resume file: "
    data[:file_name] = gets.chomp

    data
end

def generate_pdf(data)
    Prawn::Document.generate("#{data[:file_name]}.pdf") do |pdf|
        pdf.text data[:name], size: 18, style: :bold
        pdf.text "#{data[:email]} | #{data[:phone]}", size: 12, style: :italic
        pdf.move_down 20
        
        pdf.stroke_horizontal_rule
        pdf.move_down 10
        pdf.text "Professional Summary", size: 16, style: :bold
        pdf.text data[:summary], size: 12, align: :justify
        pdf.move_down 20
        
        pdf.stroke_horizontal_rule
        pdf.move_down 10
        pdf.text "Work Experiences", size: 16, style: :bold
        data[:experiences].each do |exp|
            pdf.text "#{exp[:title]} - #{exp[:company]}", size: 14, style: :bold
            pdf.text exp[:description], size: 12, align: :justify
            pdf.move_down 10
        end
        pdf.move_down 20
    
        pdf.stroke_horizontal_rule
        pdf.move_down 10
        pdf.text "Skills", size: 16, style: :bold
        pdf.move_down 5
        data[:skills].each do |skill|
        pdf.text "- #{skill}", size: 12
        end
    end

    puts "Resume generated successfully: #{data[:file_name]}.pdf"
end


user_data = collect_data
generate_pdf(user_data)