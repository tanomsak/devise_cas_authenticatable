ActionDispatch::Session::CacheStore.class_eval do

  include DeviseCasAuthenticatable::SingleSignOut::SetSession
  alias_method_chain :set_session, :storage

end