module Tools

	module_function

	def query params

    limit = 100
    start = 0

    limit = params[:limit].to_i if params[:limit] && params[:limit] != ''

    page = 1

    page = params[:page].to_i if params[:page] && params[:page] != ''

    start = (page-1) * limit

		q = ""

    list = []
    params.each_with_index do |(key,val),i|

      if !['action','controller','format','limit','page'].include?(key)

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

    q << " LIMIT #{start},#{limit}"

    q

  end

end