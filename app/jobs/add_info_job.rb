class AddInfoJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Info.create(title: '🎉新年のご挨拶🎉', body: 'あけましておめでとうございます🎉')
  end
end