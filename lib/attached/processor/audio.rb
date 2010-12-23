require 'attached/processor/base'
require 'attached/processor/error'

module Attached
  module Processor
    class Audio < Base
      
      
      attr_reader :path
      attr_reader :extension
      attr_reader :preset
      
      
      # Create a processor.
      #
      # Parameters:
      # 
      # * file       - The file to be processed.
      # * options    - The options to be applied to the processing.
      # * attachment - The attachment the processor is being run for.
    
      def initialize(file, options = {}, attachment = nil)
        super
        
        @path      = self.file.path
        
        @preset    = options[:preset]
        @extension = options[:extension]
        
        @extension ||= File.extname(self.file.path)
      end
    
    
      # Helper function for calling processors.
      #
      # Usage:
      #
      #   self.process
    
      def process
        
        result = Tempfile.new(["", self.extension])
        result.binmode
        
        begin
          
          parameters = []
          
          parameters << "--preset #{self.preset}" if self.preset
          
          parameters << self.path
          parameters << result.path
          
          parameters = parameters.join(" ").squeeze(" ")
          
          `lame #{parameters}`
          
        rescue Errno::ENOENT  
          raise "command 'lame' not found: ensure LAME is installed"
        end
        
        unless $?.exitstatus == 0
          raise Attached::Processor::Error, "attachment file must be an audio file"
        end
        
        return result
        
      end
      
    end
  end
end