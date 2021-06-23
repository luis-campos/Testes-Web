Dado('que estou na página do Google') do
    @search = Search_GooglePage.new
    @search.load
    @search.layout_page
  end
  
Quando('faço uma pesquisa') do
  @search.input_search
  @search.search_btn
end

Então('vejo uma lista com todos os sites correspondentes à pesquisa') do
  @search.result_list
end

Quando('faço uma pesquisa vazia com Estou com Sorte') do
  @search.lucky_search_btn
end

Então('sou redirecionada para a página de Doodles') do
  @search.doodle_item
end