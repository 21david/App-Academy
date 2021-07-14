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

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @user_id = options['user_id']
      end


    def self.all
        data = QuestionDBConnection.instance.execute("SELECT * FROM questions")
        data.map { |ele| Question.new(ele) }
    end
end

class User
    attr_accessor :id, :fname, :lname

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
      end


    def self.all
        data = QuestionDBConnection.instance.execute("SELECT * FROM users")
        data.map { |ele| User.new(ele) }
    end
end

class QuestionFollow
    attr_accessor :id, :user_id, :question_id

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
      end


    def self.all
        data = QuestionDBConnection.instance.execute("SELECT * FROM questions_follows")
        data.map { |ele| QuestionFollow.new(ele) }
    end
end

class Reply
    attr_accessor :id, :question_id, :parent_reply_id, :user_id, :body

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @parent_reply_id = options['parent_reply_id']
        @user_id = options['user_id']
        @body = options['body']
      end


    def self.all
        data = QuestionDBConnection.instance.execute("SELECT * FROM replies")
        data.map { |ele| Reply.new(ele) }
    end
end

class QuestionLike
    attr_accessor :id, :user_id, :question_id

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
      end


    def self.all
        data = QuestionDBConnection.instance.execute("SELECT * FROM question_likes")
        data.map { |ele| QuestionLike.new(ele) }
    end
end