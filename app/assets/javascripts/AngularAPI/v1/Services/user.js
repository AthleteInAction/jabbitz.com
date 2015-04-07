App.service('UserSVC',['ApiModelV1','$timeout',function(ApiModelV1,$timeout){

	this.users = {

		loading: {},

		list: [],

		find: function(id,complete){

			var t = this;

			var obj = t.new({id: id});

			obj.loading = true;

			var options = {
				one: 'users',
				id: id
			};

			ApiModelV1.get(options,function(data){

				var u = t.new(data.user);

				angular.forEach(u,function(val,key){

					obj[key] = val;

				});

				if (complete){complete(obj,false);}

				delete obj.loading;

			},function(data){

				if (complete){complete(data,true);}

				delete obj.loading;

			});

			return obj;

		},

		get: function(complete){

			var t = this;

			t.loading.get = true;

			var options = {
				one: 'users'
			};

			ApiModelV1.query(options,function(data){

				var list = [];

				angular.forEach(data.users,function(val,key){

					list.push(t.new(val));

				});

				t.list = list;
				
				delete t.loading.get;

				if (complete){complete(t.list,false);}

			},function(data){

				delete t.loading.get;

				if (complete){complete(data,true);}

			});

		},

		new: function(api_module){

			var t = this;

			if (!api_module){api_module = {};}

			var log = {};
			angular.forEach(api_module,function(val,key){

				log[key] = val;

			});

			api_module.x876 = log;

			api_module.update = function(field,value,complete){

				var new_item = {};
				var new_value = angular.copy(value);
				new_item[field] = new_value;

				if (api_module.x876[field] == new_value){
					return false;
				}

				var ID = api_module.id;

				var options = {
					one: 'users',
					id: ID
				};

				var Item = new ApiModelV1({user: new_item});

				api_module.loading = {};
				api_module.loading[field] = 1;

				Item.$save(options,function(data){

					api_module.x876[field] = new_value;

					api_module.loading[field] = 2;
					$timeout(function(){
						delete api_module.loading[field];
					},2000);

					if (complete){complete(data.user,false);}

				},function(data){

					api_module[field] = api_module.x876[field];

					api_module.loading[field] = 3;

					if (complete){complete(data,true);}

				});

			};

			api_module.save = function(complete){

				var new_item = angular.copy(api_module);
				delete new_item.x876;

				var ID = null;
				if (new_item.id){
					ID = new_item.id;
					delete new_item.id;
				}

				var options = {
					one: 'users'
				};

				var Item = new ApiModelV1({user: new_item});

				if (ID){

					api_module.loading = 1;

					options.id = ID;

					Item.$save(options,function(data){

						api_module.loading = 2;
						$timeout(function(){
							delete api_module.loading;
						},2000);

						if (complete){complete(data.user,false);}

					},function(data){

						api_module.loading = 3;

						if (complete){complete(data,true);}

					});


				} else {

					api_module.loading = true;

					Item.$create(options,function(data){

						api_module.id = data.user.id;
						api_module.created_at = data.user.created_at;
						api_module.updated_at = data.user.updated_at;

						delete api_module.loading;

						t.list.unshift(api_module);

						if (complete){complete(data.user,false);}

					},function(data){

						delete api_module.loading;

						if (complete){complete(data,true);}

					});

				}

			};

			api_module.delete = function(complete){

				api_module.loading = true;

				var options = {
					one: 'users',
					id: api_module.id
				};

				ApiModelV1.destroy(options,function(data){

					t.list.removeWhere('id',api_module.id);

					delete api_module.loading;

					if (complete){complete(data,false);}

				},function(data){

					delete api_module.loading;

					if (complete){complete(data,true);}

				});

			};

			return api_module;

		}

	};

}]);