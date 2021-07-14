require 'sqlite3'
require 'singleton'

class QuestionDBConnection < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    
    end

end

class Question
    attr_accessor :id, :title, :body, :user_id

    def initialize(id,title,body,user_id)
        @id = id
        @title = title
        @body = body
        @user_id = user_id
    end

    def self.all
        data = QuestionDBConnection.instance.execute("SELECT * FROM questions")
        data.map { |id,title,body,user_id | Question.new(id,title,body,user_id) }
    end
end