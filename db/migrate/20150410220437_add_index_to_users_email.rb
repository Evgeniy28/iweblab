class AddIndexToUsersEmail < ActiveRecord::Migration
	def change
		add_index :users, :email, unique: true #rails метод add_index для добавления индекса на столбце email таблицы users, уникальность обеспечивает опция unique: true.
	end
end
