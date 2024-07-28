import collections

def solution(genres, plays):
    ans = []
    
    genres_count = collections.defaultdict(int)
    genres_songs = collections.defaultdict(list)
    
    for idx, genres in enumerate(genres):
        genres_count[genres] += plays[idx]
        genres_songs[genres].append((idx, plays[idx]))
    
    for genre in sorted(genres_count, key= lambda x: -genres_count[x]):
        # print(genre)
        genres_songs[genre].sort(key= lambda x: (-x[1], x[0]))
        
        for genre in genres_songs[genre][:2]:
            ans.append(genre[0])
                
    return ans