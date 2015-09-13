angular.module('GoogleModule',['ApiModelV1Module'])
.service('GoogleSVC',['ApiModelV1','$timeout',function(ApiModelV1,$timeout){

	this.googles = {

		loading: {},

		key: {},

		list: [],

		meta: {},

		input: {},

		get: function(q,complete){

			var t = this;

			t.loading.get = true;

			var options = {
				one: 'googles'
			};

			options = $.extend(options,{q: q});

			ApiModelV1.query(options,function(data){

				var list = [];

				angular.forEach(data.items,function(val,key){

					list.push(val);

				});

				t.list = list;

				delete t.loading.get;

				if (complete){complete(t.list,false);}

			},function(data){

				JP(data);

				delete t.loading.get;

				if (complete){complete(data,true);}

			});

		}

	};

}]);