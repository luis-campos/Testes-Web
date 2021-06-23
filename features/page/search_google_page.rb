class Search_GooglePage < SitePrism::Page
	set_url ENVIRONMENT['CB']	

  	def initialize
		@field_text = 'input.gLFyf.gsfi'
		@btn_search = 'input.gNO89b'
		@btn_search_lucky = 'input.RNmpXc'
		@link_list = 'rso'
		@doodle = 'latest'
	end
	
	def layout_page
		find(@field_text)
	end

	def input_search
		find(@field_text).click
		find(@field_text).set('piramide de testes')
	end

	def search_btn
		find(@btn_search).click
	end

	def lucky_search_btn
		find(@btn_search_lucky).click
	end

	def result_list
		find(id: @link_list)
	end

	def doodle_item
		find(id: @doodle)
	end
end