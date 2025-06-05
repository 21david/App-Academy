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

    def self.find_by_id(id)
        question = QuestionDBConnection.instance.execute(<<-SQL, id)
          SELECT
            *
          FROM
            questions
          WHERE
            id=?
        SQL
        return nil unless question.length > 0
    
        Question.new(question.first) # play is stored in an array!
    end

    def self.find_by_author_id(author_id)
        question = QuestionDBConnection.instance.execute(<<-SQL, author_id)
          SELECT
            *
          FROM
            questions
          WHERE
            user_id=?
        SQL
        return nil unless question.length > 0
    
        Question.new(question.first) # play is stored in an array!
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

    def self.find_by_id(id)
        user = QuestionDBConnection.instance.execute(<<-SQL, id)
          SELECT
            *
          FROM
            users
          WHERE
            id=?
        SQL
        return nil unless user.length > 0
    
        User.new(user.first) # play is stored in an array!
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

    def self.find_by_id(id)
        questionfollow = QuestionDBConnection.instance.execute(<<-SQL, id)
          SELECT
            *
          FROM
            questions_follows
          WHERE
            id=?
        SQL
        return nil unless questionfollow.length > 0
    
        QuestionFollow.new(questionfollow.first) # play is stored in an array!
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

    def self.find_by_id(id)
        reply = QuestionDBConnection.instance.execute(<<-SQL, id)
          SELECT
            *
          FROM
            replies
          WHERE
            id=?
        SQL
        return nil unless reply.length > 0
    
        Reply.new(reply.first) # play is stored in an array!
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

    def self.find_by_id(id)
        questionlike = QuestionDBConnection.instance.execute(<<-SQL, id)
          SELECT
            *
          FROM
            question_likes
          WHERE
            id=?
        SQL
        return nil unless questionlike.length > 0
    
        QuestionLike.new(questionlike.first) # play is stored in an array!
    end
end