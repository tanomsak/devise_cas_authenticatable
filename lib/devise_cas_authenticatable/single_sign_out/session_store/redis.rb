# require "action_controller/session/redis_session_store"
require 'action_dispatch/middleware/session/redis_store'

module DeviseCasAuthenticatable
  module SingleSignOut
    module RedisSessionStore

      include DeviseCasAuthenticatable::SingleSignOut::SetSession

      def destroy_session(env, sid, session_data) #??
        @pool.del(sid)
      end
    end
  end
end


# if ::Redis::Store.rails3?
  ActionDispatch::Session::RedisStore.class_eval do
    include DeviseCasAuthenticatable::SingleSignOut::RedisSessionStore
    alias_method_chain :set_session, :storage
  end
# else
#   ActionController::Session::RedisSessionStore.class_eval do
#     include DeviseCasAuthenticatable::SingleSignOut::RedisSessionStore
#     alias_method_chain :set_session, :storage
#   end
# end
