def solution(today, terms, privacies):
    
    def yearToDate(year):
        return year * 12 * 28
    
    def monthToDate(month):
        return month * 28
    
    def getDate(year, month, date):
        return yearToDate(year) + monthToDate(month) + date
    
    # 오늘 날짜
    today_year, today_month ,today_day = map(int, today.split("."))
    today_date = getDate(today_year, today_month, today_day)
    
    # 약관 별 유효기간
    term_graph = {}
    for term in terms:
        key, value = term.split()
        term_graph[key] = monthToDate(int(value))
        
    ans = []
    for idx, privacy in enumerate(privacies):
        register, term = privacy.split()
        year, month, day = map(int, register.split("."))
        resister_date = getDate(year, month, day)
        
        if resister_date + term_graph[term] <= today_date:
            ans.append(idx+1)
        
    return ans