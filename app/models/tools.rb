module Tools

	module_function

	def query params

		q = "SELECT * FROM users"

    list = []
    params.each_with_index do |(key,val),i|

      if !['action','controller','format'].include?(key)

        type = 'AND'
        type = 'OR' if val[0] == '|'
        val.gsub!('|','')
        opp = '='
        if val[0] == '*' || val[-1] == '*'
          val.gsub!('*','%')
          opp = 'LIKE'
        end
        list << " #{type} " if list.count > 0
        list << "#{key} #{opp} '#{val}'"

      end

    end

    q << " WHERE (" if list.count > 0
    q << list.join('')
    q << ")" if list.count > 0

    q << ' LIMIT 100'

    q

  end

end