def solution(coin, cards):
    n = len(cards) // 3
    target = len(cards) + 1
    my_card = set(cards[:n])
    temp_card = set()
    cards = cards[n:]
    
    def deleteCard():
        nonlocal coin 
        
        # 손에 있는 카드 버릴지 체크
        for card1 in my_card:
            for card2 in my_card:
                if card1 != card2 and card1 + card2 == target:
                    # print("내 손에서 다 버려", card1, card2)
                    my_card.remove(card1)
                    my_card.remove(card2)
                    return True
        
        # 돈 없으면 종료
        if coin == 0:
            # print("돈없어")
            return False
        
        # 손에 있는 카드와 임시 카드 쌍으로 버릴지 체크
        if coin >= 1:
            for card1 in my_card:
                for card2 in temp_card:
                    if card1 + card2 == target:
                        # print("손에서 하나, 임시에서 하나", card1, card2)
                        my_card.remove(card1)
                        temp_card.remove(card2)
                        coin -= 1
                        return True
                
        # 임시 카드에서 두 개 버릴지 체크
        if coin >= 2:
            for card1 in temp_card:
                for card2 in temp_card:
                    if card1 != card2 and card1 + card2 == target:
                        # print("임시 카드에서 다 버려", card1, card2)
                        temp_card.remove(card1)
                        temp_card.remove(card2)
                        coin -= 2
                        return True
                    
        # print("아무일도...")
        return False
    
    round = 1
    while cards:
        temp_card.update(cards[:2])
        cards = cards[2:]
        
        # print(my_card, "....", temp_card, ".....", cards)
        if not deleteCard():
            break
        
        round += 1
        
    return round