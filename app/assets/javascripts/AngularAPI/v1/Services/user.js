App.service('UserSVC',['ApiModelV1',function(ApiModelV1){

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

		new: function(user){

			var t = this;

			if (!user){user = {};}

			user.save = function(complete){

				user.loading = true;

				var options = {
					one: 'users'
				};

				var User = new ApiModelV1({user: user});

				if (user.id){

					options.id = user.id;

					User.$save(options,function(data){

						user.updated_at = data.user.updated_at;

						delete user.loading;

						if (complete){complete(data.user,false);}

					},function(data){

						delete user.loading;

						if (complete){complete(data,true);}

					});


				} else {

					User.$create(options,function(data){

						user.id = data.user.id;
						user.created_at = data.user.created_at;
						user.updated_at = data.user.updated_at;

						delete user.loading;

						t.list.unshift(user);

						if (complete){complete(data.user,false);}

					},function(data){

						delete user.loading;

						if (complete){complete(data,true);}

					});

				}

			};

			user.delete = function(complete){

				user.loading = true;

				var options = {
					one: 'users',
					id: user.id
				};

				ApiModelV1.destroy(options,function(data){

					t.list.removeWhere('id',user.id);

					delete user.loading;

					if (complete){complete(data,false);}

				},function(data){

					delete user.loading;

					if (complete){complete(data,true);}

				});

			};

			return user;

		}

	};

}]);