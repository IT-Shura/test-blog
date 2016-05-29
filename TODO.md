- [x] Апрув комментов
- [x] Теги
- [x] Селекты на странице
- [x] Поиск с подсветкой
- [x] Категории на странице категорий
- [ ] Тесты
- [ ] Comfirmable

@search = MyModel.ransack(params[:q])
@result = @search.result(distinct: true).includes(:related_model)
@result = @result.tagged_with(params[:tags].split(/\s*,\s*/)) if params[:tag].present?
@result = @result.paginate(page: params[:page], per_page: 20)