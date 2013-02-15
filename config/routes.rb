# Create a route to DEFAULT_WEB, if such is specified; also register a generic route
DEFAULT_WEB='wiki'

def connect_to_web(map, generic_path, generic_routing_options)
  if defined? DEFAULT_WEB
    explicit_path = generic_path.gsub(/:web\/?/, '')
    explicit_routing_options = generic_routing_options.merge(:web => DEFAULT_WEB)
    get(explicit_path, explicit_routing_options)
  end
  get(generic_path, generic_routing_options)
end

# :id's can be arbitrary junk
  id_regexp = /.+/

Instiki::Engine.routes.draw do
  get 'create_system', :controller => 'admin', :action => 'create_system'
  get 'create_web', :controller => 'admin', :action => 'create_web'
  get 'delete_web', :controller => 'admin', :action => 'delete_web'
  get 'delete_files', :controller => 'admin', :action => 'delete_files'
  get 'web_list', :controller => 'wiki', :action => 'web_list'

  connect_to_web self, ':web/edit_web', :controller => 'admin', :action => 'edit_web'
  connect_to_web self, ':web/remove_orphaned_pages', :controller => 'admin', :action => 'remove_orphaned_pages'
  connect_to_web self, ':web/remove_orphaned_pages_in_category', :controller => 'admin', :action => 'remove_orphaned_pages_in_category'
  connect_to_web self, ':web/file/delete/:id', :controller => 'file', :action => 'delete', :requirements => {:id => /[-._\w]+/}, :id => nil
  connect_to_web self, ':web/files/pngs/:id', :controller => 'file', :action => 'blahtex_png', :requirements => {:id => /[-._\w]+/}, :id => nil
  connect_to_web self, ':web/files/:id', :controller => 'file', :action => 'file', :requirements => {:id => /[-._\w]+/}, :id => nil
  connect_to_web self, ':web/file_list/:sort_order', :controller => 'wiki', :action => 'file_list', :sort_order => nil
  connect_to_web self, ':web/import/:id', :controller => 'file', :action => 'import'
  connect_to_web self, ':web/login', :controller => 'wiki', :action => 'login'
  connect_to_web self, ':web/web_list', :controller => 'wiki', :action => 'web_list'
  connect_to_web self, ':web/show/diff/:id', :controller => 'wiki', :action => 'show', :mode => 'diff', :requirements => {:id => id_regexp}
  connect_to_web self, ':web/revision/diff/:id/:rev', :controller => 'wiki', :action => 'revision', :mode => 'diff',
       :requirements => { :rev => /\d+/, :id => id_regexp}
  connect_to_web self, ':web/revision/:id/:rev', :controller => 'wiki', :action => 'revision', :requirements => { :rev => /\d+/, :id => id_regexp}
  connect_to_web self, ':web/source/:id/:rev', :controller => 'wiki', :action => 'source', :requirements => { :rev => /\d+/, :id => id_regexp}
  connect_to_web self, ':web/list/:category', :controller => 'wiki', :action => 'list', :requirements => { :category => /.*/}, :category => nil
  connect_to_web self, ':web/recently_revised/:category', :controller => 'wiki', :action => 'recently_revised', :requirements => { :category => /.*/}, :category => nil
  connect_to_web self, ':web/:action/:id', :controller => 'wiki', :requirements => {:id => id_regexp}
  connect_to_web self, ':web/:action', :controller => 'wiki'
  connect_to_web self, ':web', :controller => 'wiki', :action => 'index'

  if defined? DEFAULT_WEB
    get '', :controller => 'wiki', :web => DEFAULT_WEB, :action => 'index'
  else
    get '', :controller => 'wiki', :action => 'index'
  end
end
