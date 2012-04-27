class Comment < ActiveRecord::Base
  belongs_to :article
  after_create :enqueue_total_word_count
  validates :article_id, :presence => true

  def self.for_dashboard
    order('created_at DESC').limit(5).all
  end

  def word_count
    body.split.count
  end

  def self.total_word_count
    all.inject(0) {|total, a| total += a.word_count }
  end

  private

  def enqueue_total_word_count
    Resque.enqueue(CommentTotalWordCount)
  end
end
