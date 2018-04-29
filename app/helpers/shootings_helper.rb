module ShootingsHelper
    def youtube_id
        YouTubeAddy.extract_video_id(@video.url)
      end
end
