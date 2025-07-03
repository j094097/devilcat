module Constants
    extend self

	DIVINATION_CARDS = [
		"誘餌之期待",
        "奧薇莉亞的恩典",
        "星際保護",
        "凜冽之風",
        "棄財求生",
        "瓦爾之傲",
        "夕陽紅顏",
        "正義之福",
        "燃燒之血",
        "渾沌性情",
        "貓咪議會",
        "暗黑的誘惑",
        "德瑞競之狂",
        "大地吞食者",
        "明鏡",
        "謙遜",
        "她的面具",
        "獵者的獎勵",
        "孤軍奮戰",
        "忠誠",
        "正氣",
        "有毒信仰",
        "鼠輩",
        "巨獸",
        "背叛",
        "風暴將至",
        "雷針",
        "惡夢",
        "惡魔之女",
        "瘋醫",
        "黑暗三面",
        "寧靜",
        "蛛網",
        "熱心民眾",
        "逃脫大師",
        "盛宴",
        "竊命者",
        "月影女祭司",
        "拾荒者",
        "王座",
	]

    def get_card_list
        DIVINATION_CARDS
    end

    def get_random_card(number)
        get_card_list.shuffle.sample(number)
    end
end