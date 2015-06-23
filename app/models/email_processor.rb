class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    Post.create!(
      headline: @email.to[0][:email]
    )
    if @email.to[0][:email] == "lastnews@mctrenching.com"
      @post = Post.last
      @post.update(
        headline: @email.subject,
        body: @email.body
      )
    elsif to_address == "lastshow@mctrenching.com"
      @show = Show.last
      @show.update(
        date: DateTime.parse(@email.subject),
        description: @email.raw_body
      )
    elsif to_address == "news@mctrenching.com"
      Post.create!(
        headline: @email.subject,
        body: @email.body
      )
    elsif to_address == "shows@mctrenching.com"
      Show.create!(
        date: DateTime.parse(@email.subject),
        description: @email.raw_body
      )
    else
      
    end
  end
end