	desc "This is afile to generate fake data"
	task:fake_data =>:environment do   # fake_data is the file name
       
       User.create(email: "1@gmail.com", password: "secret1")
       User.create(email: "2@gmail.com", password: "secret12")
       User.create(email: "3@gmail.com", password: "secret123")
       User.create(email: "4@gmail.com", password: "secret1234")

		20.times do
			user=User.order("RANDOM()").first
			client = Client.new
			client.name = Faker::Name.name
			client.company = Faker::Company.name
			client.mobile = Faker::Number.number(10)
			client.website = Faker::Internet.domain_name
			client.fax_no = Faker::Number.number(6)
			client.user_id=user.id
			client.save(validate: false)
             3.times do
				project= Project.new
				project.name=Faker::App.name
				project.description = Faker::Lorem.sentence
				project.start_date =Faker::Date.between((Date.today - 1.year).beginning_of_year,Date.today.end_of_month)
				project.status=["open","on-going","completed"].shuffle.first
				project.client_id=client.id
				project.user_id = user.id
				project.save

				5.times do
					
				task =Task.new
				task.name =["client approval","vendor finalization","hosting provider","team meeting","site visit"].shuffle.first
				task.due_date =Faker::Date.between(project.start_date,project.start_date+2.weeks)
				task.is_completed=[true,false].shuffle.first
				task.project_id=project.id
				task.user_id =user.id
				task.save
			end
		end
	end
		
	end