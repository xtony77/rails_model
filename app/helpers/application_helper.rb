module ApplicationHelper
	def news_group_name(group_id)
		t('help.news_group.group_' + group_id)
	end

	def about_group_name(group_id)
		t('help.about_group.group_' + group_id)
	end

	def album_group_name(group_id)
		t('help.album_group.group_' + group_id)
	end
end
