module CarrierWave
  module FFMPEG
    module ClassMethods
      def encode_video(target_format)
        process encode_video: [target_format]
      end

      def encode_audio(target_format)
        process encode_audio: [target_format]
      end
    end

    def encode_video(format)
      directory = File.dirname(current_path)
      tmpfile = File.join(directory, 'tmpfile')
      File.rename(current_path, tmpfile)

      new_name = File.basename(current_path, '.*') + '.' + format.to_s
      current_extenstion = File.extname(current_path).gsub('.', '')
      encoded_file = File.join(directory, new_name)
      options = "-preset slow -vf 'scale=-1:480, scale=trunc(iw/2)*2:480' -crf 15"

      file = ::FFMPEG::Movie.new(tmpfile)
      if file.valid? # true (would be false if ffmpeg fails to read the movie)
        file.transcode(encoded_file, options) { |progress| puts "#{(progress * 100).round(2)} %" }
      else
        model.destroy
        return false
      end
      File.delete(tmpfile)

      # warning: magic!
      # change format for uploaded file name and store file format
      # without this lines processed video files will remain in cache folder
      self.filename[-current_extenstion.size..-1] = format.to_s
      self.file.file[-current_extenstion.size..-1] = format.to_s
    end

    def encode_audio(format)
      directory = File.dirname(current_path)
      tmpfile = File.join(directory, 'tmpfile')
      File.rename(current_path, tmpfile)

      new_name = File.basename(current_path, '.*') + '.' + format.to_s
      current_extenstion = File.extname(current_path).gsub('.', '')
      encoded_file = File.join(directory, new_name)

      file = ::FFMPEG::Movie.new(tmpfile)
      if file.valid? # true (would be false if ffmpeg fails to read the movie)
        file.transcode(encoded_file) { |progress| puts "#{(progress * 100).round(2)} %" }
      else
        model.destroy
        return false
      end
      File.delete(tmpfile)

      # warning: magic!
      # change format for uploaded file name and store file format
      # without this lines processed video files will remain in cache folder
      self.filename[-current_extenstion.size..-1] = format.to_s
      self.file.file[-current_extenstion.size..-1] = format.to_s
    end
  end
end
