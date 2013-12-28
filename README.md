# Jekyll & ZURB

Source for my personal blog running on Jekyll and Foundation.

Just clone and blog: create the `_posts` and `_drafts` folder.

Lots of baked in features that work even if you don't want to use Foundation.

- Bare bones [Jekyll](http://jekyllrb.com/) blog: HTML5 & CSS3 ready.
- Automatically publish to [GitHub pages](http://pages.github.com/) with [Travis CI](https://travis-ci.org/).
- Running [Foundation by ZURB](http://foundation.zurb.com/).
- Includes Foundation Icon Fonts.
- Load fonts with Web Font Loader.
- Asset pipeline with [Jekyll::AssetsPlugin](https://github.com/ixti/jekyll-assets).
- Bower for asset dependency management.
- Plugins for easy responsive images and YouTube videos.
- [Compass](http://compass-style.org/), [Sass](http://sass-lang.com/), [CoffeeScript](http://coffeescript.org/).
- Basic [Rake](https://github.com/jimweirich/rake) tasks with support for dev and testing modes, run `rake -D` for info.
- Social media buttons (optional).
- Meta data system for SEO and social media support.
- Optional pagination using Foundation.
- [Disqus](https://disqus.com/) ready: set `disqus: your_shortname` in `_config.yml`.
- [Google Analytics](http://www.google.com/analytics/) ready: see `google_analytics` variable in `_config.yml`.
- [Piwik](https://piwik.org/) ready: set `piwik: yoursite.com/piwik/` in `_config.yml` (yoursite.com/piwik/ points to the piwik install root).
- Easily incorporate the source from other web projects as subdirectories in your site (see sub_content in `_config.yml`).

## Quick start

You will need [Ruby Bundler](http://bundler.io/) and [Bower](http://bower.io/).

Just clone this with

````bash
$ git clone https://github.com/razor-x/jekyll-and-zurb.git my-blog
````

run `bundle && bower install` and create the `_posts` folder.
Head over to the [Jekyll Docs](http://jekyllrb.com/docs/home/) for the rest of the details.

## Example site and documentation

The `master` branch of this project is designed to be used
as a starting point for your site and as a branch to pull updates from.
Thus, most features are disabled by default,
and only the `index.html` page has been created with minimal markup.

The `example` branch is a full website that will contain
real examples and documentation for the included features.
That branch is automatically built and published by Travis CI.

[Examples site hosted on GitHub pages.](http://razor-x.github.io/jekyll-and-zurb/)

## Add future update support

If you want to merge in future updates from this project and have your own origin,
set up a separate branch to track this.

````bash
$ git remote rename origin razor-x-jekyll-and-zurb
$ git branch jekyll-and-zurb
$ git branch -u razor-x-jekyll-and-zurb/master jekyll-and-zurb
````

Then add an origin and push master

````bash
$ git remote add origin git@github.com:username/my-blog.git
$ git push -u origin master
````

Now, the `jekyll-and-zurb` branch will pull changes from this project,
which you can then merge into your other branches.

If you later clone your repo you will need to create the update branch again.

````bash
$ git remote add razor-x-jekyll-and-zurb https://github.com/razor-x/jekyll-and-zurb.git
$ git fetch razor-x-jekyll-and-zurb
$ git checkout -b jekyll-and-zurb razor-x-jekyll-and-zurb/master
````

## Automatic publishing to GitHub pages with Travis CI

If you are hosting at `username.github.io` you will need to leave the `master` branch empty
and put your code in a different branch.
The `master` branch otherwise functions like the `gh-pages` branch below.

[See here](http://pages.github.com/) for details on the different use cases.

First, make a `gh-pages` branch unless you are using `master` as discussed above,

````bash
$ git checkout --orphan gh-pages
````

and **remove all files and folders except the `.git` directory**.

Then, make an initial commit with only `index.html`, push it, and make sure goes live online.

````bash
$ git add --all
$ echo "GitHub Pages placeholder" > index.html
$ git add index.html
$ git commit -m "GitHub Pages placeholder"
$ git push -u origin gh-pages
$ git checkout master
````

Next, install the travis gem,

````bash
$ gem install travis
````

create a [GitHub Personal Access Token](https://github.com/settings/applications),
and add your name, email, and token to travis as encrypted data
(fill in your values in the command below),

````bash
$ travis encrypt 'GIT_NAME="Your Name" GIT_EMAIL=you@example.com GH_TOKEN=token'
````
and replace the secure string in `.travis.yml` with the one you just got;
also set the branch you want to build (normally `master`, see the comments in that file).

Finally, switch on your repo in Travis CI and push your changes.

````bash
$ git add .travis.yml
$ git commit -m "Automatic publishing to GitHub pages with Travis CI."
$ git push
````

## Updating

The `Gemfile` is using pessimistic version constraints for everything,
so if you don't want to wait for updates, you need to bump the versions yourself.

JavaScript library versions need to be updated in `bower.json` and `_config.yml` (for CDN support).
If you want to update Foundation, update the version number in `bower.json`.

## License

This code is licensed under the MIT license.

## Warranty

This software is provided "as is" and without any express or
implied warranties, including, without limitation, the implied
warranties of merchantibility and fitness for a particular
purpose.
