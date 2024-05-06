# frozen_string_literal: true

module ApplicationHelper
  def format_date(date)
    current_time = Time.zone.now
    one_month_in_seconds = 10 * 24 * 60 * 60

    if current_time - date >= one_month_in_seconds
      date.strftime('%Y年%m月%d日')
    else
      "#{distance_of_time_in_words_to_now(date)}前"
    end
  end

  def truncate_text(text, limit)
    if text.length > limit
      truncated_text = text[0...limit]
      truncated_text += '...'
      sanitize truncated_text, tags: %w[strong em], attributes: []
    else
      sanitize text, tags: %w[strong em], attributes: []
    end
  end

  # NOTE: ローカライズ
  def local_user_name
    User.model_name.human
  end

  # NOTE: ローカライズ
  def local_user_column_name(column)
    User.human_attribute_name(column)
  end

  # NOTE: schema
  def default_meta_tags
    {
      site: 'my.band',
      title: 'my.band',
      reverse: true,
      separator: '|',
      description: 'バンドメンバー募集掲示板',
      keywords: 'my.band, バンドメンバー, 募集, 掲示板',
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      og: {
        site_name: 'my.band',
        title: 'my.band',
        description: 'バンドメンバー募集掲示板',
        type: 'website',
        url: request.original_url,
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@BeatsaberDJP'
      }
    }
  end

  # NOTE: schema
  def schema
    description = 'バンドメンバー募集掲示板'

    {
      "@context": 'https://schema.org',
      "@type": 'DiscussionForumPosting',
      "headline": description.to_s
    }
  end
end
