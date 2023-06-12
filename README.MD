# Testes automatizados Web

## Esse projeto foi criado apenas para aprender alguns conceitos de teste automatizado em web, utilizando cucumber e ruby.

# Pré-requisitos e como rodar a aplicação/testes

Para iniciar o projeto, em seu terminal execute o comando 
```bash 
bundle init 
```
que ira gerar um arquivo Gemfile, que é onde ficam as dependências do projeto

Dentro do arquivo Gemfile coloque os seguintes comandos:
```bash
source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# gem "rails"
gem 'capybara'
gem 'cucumber'
gem 'site_prism'
gem 'selenium-webdriver'
gem 'webdrivers'
gem 'pry'
```

Depois, em seu terminal execute o comando
```bash
bundle install 
```
para instalar as dependências do projeto

Ainda no terminal execute o comando 
```bash 
cucumber --init 
```
para criar a estrutura de arquivos das features:
```bash
features
	|
	--step_definations
	--support
		|
		--env.rb
```

Dentro do arquivo env.rb, cole o seguinte código:
```bash
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'pry'

browser = ENV['BROWSER']
ENVIRONMENT = YAML.load_file('./config/env.yml')

Capybara.configure do |config|
  browser = :selenium_chrome if browser.nil?
  config.default_driver = browser.to_sym
  config.default_max_wait_time = 10
end

Capybara.page.driver.browser.manage.window.maximize
```

Crie uma pasta config na raiz do projeto, dentro desta pasta crei dois arquivos: cucumber.yml e env.yml
No arquivo cucumber.yml cole o seguinte código:
```bash
default: -p dev 

# ambiente
dev: PLATFORM=dev -r features/support -r features/ -r features/step_definitions -r features/page -r config/dev --exclude config/hml   --tags "not @mock"
hml: PLATFORM=hml -r features/support -r features/ -r features/step_definitions -r features/page -r config/hml --exclude config/dev--tags "not @mock"  --tags "not @prod"
prod: PLATFORM=prod -r features/support -r features/ -r features/step_definitions -r features/page -r config/prod --exclude config/dev --exclude config/hml--tags "not @mock"

# browser
chrome: BROWSER=selenium_chrome
headless: BROWSER=selenium_chrome_headless
firefox: BROWSER=selenium
```

No arquivo env.yml cole o seguinte código:
```bash
dev:
CB: "O site que você for testar"
```

Agora pronto, é só montar suas features

No terminal, rode o comando 
```bash
cucumber -p dev features/"sua feature"
````
para executar os testes
