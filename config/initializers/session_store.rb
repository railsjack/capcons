# Be sure to restart your server when you modify this file.

#TestApp::Application.config.session_store :cookie_store, key: "'_capcons_session'", domain: :all
TestApp::Application.config.session_store :active_record_store 
