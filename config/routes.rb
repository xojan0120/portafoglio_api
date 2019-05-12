Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      post   '/accounts',                                      to: 'accounts#create'
      get    '/sites',                                         to: 'sites#index'
      get    '/units',                                         to: 'units#index'
      get    '/skills',                                        to: 'skills#index'
      get    '/sites/:site_id/reactions',                      to: 'reactions#index'
      get    '/sites/:site_id/views',                          to: 'views#index'
      get    '/sites/:site_id/info',                           to: 'sites#show'
      post   '/sites/:site_id/info',                           to: 'sites#update'
      post   '/sites/info',                                    to: 'sites#create'
      post   '/sites/:site_id/screenshot',                     to: 'screenshots#create'
      get    '/sites/:site_id/screenshot',                     to: 'screenshots#show'
      delete '/sites/:site_id/screenshot',                     to: 'screenshots#destroy'
      post   '/sites/:site_id/reactions',                      to: 'reactions#create'
      delete '/sites/:site_id/reactions',                      to: 'reactions#destroy'
      post   '/sites/:site_id/views',                          to: 'views#create'
      delete '/sites/:site_id',                                to: 'sites#destroy'
      get    '/users/:uid',                                    to: 'users#show'
      post   '/sites/:site_id/judge',                          to: 'judgments#show'
      post   '/users/:uid/judge',                              to: 'judgments#show'
      post   '/users/:uid',                                    to: 'users#update'
      delete '/accounts',                                      to: 'accounts#destroy'

      get    '/sites/:site_id/check',                          to: 'site_checker#show'
      get    '/users/:uid/check',                              to: 'user_checker#show'
      get    '/sites/:site_id/reactions/:reaction_name/check', to: 'reaction_checker#show'
    end
  end
end
