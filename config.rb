# Bundler versions
# set :versions, `rake versions`.split
# set :current_version, versions.last


# activate :autoprefixer
activate :directory_indexes
# Syntax highlighting
activate :syntax

# Set HAML to render HTML5 by default. It's important that HAML outputs "ugly" HTML to not mess with code blocks
set :haml, format: :html5, ugly: true
set :relative_links, true
set :layout, :docs

# Set markdown features for Redcarpet
set :markdown_engine, :kramdown
set :markdown,
    autolink: true,
    gh_blockcode: true,
    fenced_code_blocks: true,
    footnotes: true,
    no_intra_emphasis: true,
    highlight: true,
    quote: true,
    smartypants: true,
    tables: true,
    with_toc_data: true

# Make documentation for the latest version available at the top level, too.
# Any pages with names that conflict with files already at the top level will be skipped.
# ready do
#   sitemap.resources.each do |page|
#     if page.path.start_with? "#{current_version}/"
#       proxy_path = page.path["#{current_version}/".length..-1]
#       proxy proxy_path, page.path if sitemap.find_resource_by_path(proxy_path).nil?
#     end
#   end
# end

page '/sitemap.xml', layout: false

###
# Helpers
###
Dir.glob(File.expand_path('../helpers/**/*.rb', __FILE__), &method(:require))

# Set directories
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :partials_dir, 'partials'

# Blog Settings
activate :blog do |blog|
  blog.name = 'blog'
  blog.prefix = 'blog'
  blog.permalink = '{year}/{month}/{day}/{title}.html'
  blog.layout = 'blog_layout'

  blog.calendar_template = 'blog/calendar.html'
  blog.year_link = "{year}/index.html"
  blog.month_link = "{year}/{month}/index.html"
  blog.day_link = "{year}/{month}/{day}/index.html"
end

page "/blog/feed.xml", layout: false

configure :development do
  activate :livereload
end

configure :build do
  activate :minify_css
end
