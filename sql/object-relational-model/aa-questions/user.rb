class User
  attr_accessor :id, :fname, :lname

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM users")
    data.map { |datum| User.new(datum) }
  end

  def self.find_by_id(id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT 
        *
      FROM
        users
      WHERE 
        id = ?
    SQL

    User.new(data.first)
  end

  def self.find_by_name(fname, lname)
    data = QuestionsDBConnection.instance.execute(<<-SQL, fname, lname)
      SELECT 
        *
      FROM
        users
      WHERE 
        fname = ? AND lname = ?
    SQL

    return "No user found" if data.length == 0

    data.length == 1 ? User.new(data.first) : data.map { |datum| User.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end
  
  def authored_questions
    Question.find_by_author_id(@id)
  end

  def authored_replies
    Reply.find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end
end