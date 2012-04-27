class CommentTotalWordCount
  @queue = :total_word_count
  def self.perform
    sleep 10
    $redis.set 'comment_total_word_count', Comment.total_word_count
  end
end