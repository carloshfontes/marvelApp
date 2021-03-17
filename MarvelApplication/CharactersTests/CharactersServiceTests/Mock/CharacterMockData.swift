//
//  CharacterMockData.swift
//  CharactersTests
//
//  Created by Carlos Fontes on 17/03/21.
//

import Foundation


struct CharacterMockData {
    
    
    let data = """
    
    
    {
      "code": 200,
      "status": "Ok",
      "copyright": "© 2021 MARVEL",
      "attributionText": "Data provided by Marvel. © 2021 MARVEL",
      "attributionHTML": "<a href=\"http://marvel.com\">Data provided by Marvel. © 2021 MARVEL</a>",
      "etag": "6cdbdbab775835db6ac3fccd412db44daae59574",
      "data": {
        "offset": 0,
        "limit": 20,
        "total": 1493,
        "count": 20,
        "results": [
          {
            "id": 1011334,
            "name": "3-D Man",
            "description": "",
            "modified": "2014-04-29T14:18:17-0400",
            "thumbnail": {
              "path": "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
              "extension": "jpg"
            },
          {
            "id": 1017100,
            "name": "A-Bomb (HAS)",
            "description": "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! ",
            "modified": "2013-09-18T15:54:04-0400",
            "thumbnail": {
              "path": "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16",
              "extension": "jpg"
            },
          {
            "id": 1009144,
            "name": "A.I.M.",
            "description": "AIM is a terrorist organization bent on destroying the world.",
            "modified": "2013-10-17T14:41:30-0400",
            "thumbnail": {
              "path": "http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec",
              "extension": "jpg"
            },
        ]
    
    """.data(using: .utf8)
    
}
