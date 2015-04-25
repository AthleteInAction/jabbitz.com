class ChimeSerializer < ActiveModel::Serializer

	attributes :id, :author_id, :user_id, :category, :rating, :interaction_date, :site, :body, :body_html, :body_short, :employer, :job_title, :location, :school, :created_at, :updated_at

	has_one :author,key: :author_id

	def body_html

		if object.body

			object.body.to_s.gsub(/\n/,'<br>')

		else

			object.body

		end

	end

	def body_short

		if object.body

			short = object.body.to_s.gsub(/\n/,' ')

          	if short.length > 30

          		short = short[0..30].strip
          		short << '...'

          	end

			short

		else

			object.body

		end

	end

end