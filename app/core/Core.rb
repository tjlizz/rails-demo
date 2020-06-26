class Core
  def add_redis key, value
    $redis.setex key, 60 * 30, value
  end
end
