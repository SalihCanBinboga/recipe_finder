part of 'remote_recipe_data_source_test.dart';

const mockRecipeResponse = '''
{
  "from": 1,
  "to": 4,
  "count": 10000,
  "_links": {
    "next": {
      "href": "https://api.edamam.com/api/recipes/v2?app_key=f7ce5672f67e97572eed94fb0984eeda&mealType=Lunch&_cont=CHcVQBtNNQphDmgVQntAEX4BY0t3AwEVX3dDUmIbYwciVwBVQTFCUDNFZgR1AlZTSmRHVWcVY1UnBRFqX3cWQT1OcV9xBB8VADQWVhFCPwoxXVZEITQeVDcBaR4-SQ%3D%3D&type=public&app_id=19c82497",
      "title": "Next page"
    }
  },
  "hits": [
    {
      "recipe": {
        "uri": "http://www.edamam.com/ontologies/edamam.owl#recipe_bbfc1a248bd6fe277e35fe01027de91f",
        "label": "Naomi Duguid's Fried Noodles",
        "image": "https://edamam-product-images.s3.amazonaws.com/web-img/041/04158b5869398c899942336274f0e0f7.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQCJQIhC4qkNQMT%2BsfZBBM6imfSCbhc00qVjzyisP5jbTQIgXMqQdGGlAXZiff%2BGvNSrIr36AHleRUl%2BGIfUD8bwygEqwgUI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDM3sys8nakzofhDwXiqWBccYz0YciF5X1grIj6gaZZuBtpTjI9IkWAubjd7sTVJlYoexV87XA%2FB87TzPV%2FfI2zqHVQy2GpGfkVwL3Ly1qnOQ2BpRk4flwSjo0yHTDkksTs%2BXD8v2KCAUwqUxYGaM7sPQkQC32Q060ESB%2BOBIAhD1ssM%2F5b8mCPiFQw2bgGD5m6B5lFjvhrJESgb9QibQZL8I0zmfFxsz5c5f3G2mMzKoq6lEj5mdozARyAAAJ5G0Kilhlc4g%2F11N5dtj92wp1xPXsKriknz3XtezFsj%2F0v0Tq0ExabUWLJ8f1C8e%2B8c21ncWf5U1cAIfgBQ9PmOEdduFwfXIdZssJ%2FU%2FGb%2BHMP4QS0azQGD0yXjcSjunbuguH%2Bea0E3C2lFcbVgtG%2BgY7S9J5k7dCBtYgAYReml1QtxfSucUeSxSIp8giBjBj0JPr9kvpzxk6TggV%2BZCc3grqQuouJ%2FIm6AXrokvVxm7esnuj7XhmLDdPta8NlLL9o0yz1x9kWA%2Be9EvQebBY%2BhPdSOAkpdaR5M8i7LNpYwnF1QKmX2e7eIl1zxkq3DcjQqaBcpGREQV3s3u8MwXgs0z5oADHuleswS%2FMQUjZFzvoIRMr57rW7RSFCY3beAT2twX%2FpxxzwDUCMjiyGHSKoi1FSlXO6ho7jibg2P%2FOsO2u7gzUev%2B0CE5KWUPYvlCXrT%2Bd30UvGrzhpwOavbrdZ5Cnk21nv1o6CIfE0ZBeSu7ko8X07HbMZ%2ByT9kewIecODZ9I%2Ft7Df5%2B4VdvrHrqBfTBvtO4MVee16JAorw%2FmolH7iVsgprBx0W1oiwEIwTVoZje1YrDPah%2FbOrqP9BpK3XKCPhaSDh3LBbrBDruK%2F1SGg0zMjzaRsR%2Bd80ZfeIrv71uxFDFaPQoMO%2BklqIGOrEBIXOcU5WqFpqOnHohJ6zsIdyW2cDKsUOjo%2BxSSRx%2FiycpoDlLhkBwgxFH7h2BC94mIgT5fufqg1OUYConhFOxIuFZ%2FGVBCn0eZWUTigGnHCc9XAetoMd8EWZ9NEK8lcUSFVVYqxlVwi4hU6%2BAf4TWxUyrYdcATxSyOXNSDY22dBaOMICi7DPZr3AwR0FkBzhF%2F0vnmv6Pq6452uYLSBB21ZNTkEm8VLVbhqlb4748z8eb&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230423T213731Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFBHDLLY5C%2F20230423%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=59607d6111e02a7624ba6aebef5e829b88f0c472ea301922f1cba6a0f002f21f",
        "images": {
          "THUMBNAIL": {
            "url": "https://edamam-product-images.s3.amazonaws.com/web-img/041/04158b5869398c899942336274f0e0f7-s.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQCJQIhC4qkNQMT%2BsfZBBM6imfSCbhc00qVjzyisP5jbTQIgXMqQdGGlAXZiff%2BGvNSrIr36AHleRUl%2BGIfUD8bwygEqwgUI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDM3sys8nakzofhDwXiqWBccYz0YciF5X1grIj6gaZZuBtpTjI9IkWAubjd7sTVJlYoexV87XA%2FB87TzPV%2FfI2zqHVQy2GpGfkVwL3Ly1qnOQ2BpRk4flwSjo0yHTDkksTs%2BXD8v2KCAUwqUxYGaM7sPQkQC32Q060ESB%2BOBIAhD1ssM%2F5b8mCPiFQw2bgGD5m6B5lFjvhrJESgb9QibQZL8I0zmfFxsz5c5f3G2mMzKoq6lEj5mdozARyAAAJ5G0Kilhlc4g%2F11N5dtj92wp1xPXsKriknz3XtezFsj%2F0v0Tq0ExabUWLJ8f1C8e%2B8c21ncWf5U1cAIfgBQ9PmOEdduFwfXIdZssJ%2FU%2FGb%2BHMP4QS0azQGD0yXjcSjunbuguH%2Bea0E3C2lFcbVgtG%2BgY7S9J5k7dCBtYgAYReml1QtxfSucUeSxSIp8giBjBj0JPr9kvpzxk6TggV%2BZCc3grqQuouJ%2FIm6AXrokvVxm7esnuj7XhmLDdPta8NlLL9o0yz1x9kWA%2Be9EvQebBY%2BhPdSOAkpdaR5M8i7LNpYwnF1QKmX2e7eIl1zxkq3DcjQqaBcpGREQV3s3u8MwXgs0z5oADHuleswS%2FMQUjZFzvoIRMr57rW7RSFCY3beAT2twX%2FpxxzwDUCMjiyGHSKoi1FSlXO6ho7jibg2P%2FOsO2u7gzUev%2B0CE5KWUPYvlCXrT%2Bd30UvGrzhpwOavbrdZ5Cnk21nv1o6CIfE0ZBeSu7ko8X07HbMZ%2ByT9kewIecODZ9I%2Ft7Df5%2B4VdvrHrqBfTBvtO4MVee16JAorw%2FmolH7iVsgprBx0W1oiwEIwTVoZje1YrDPah%2FbOrqP9BpK3XKCPhaSDh3LBbrBDruK%2F1SGg0zMjzaRsR%2Bd80ZfeIrv71uxFDFaPQoMO%2BklqIGOrEBIXOcU5WqFpqOnHohJ6zsIdyW2cDKsUOjo%2BxSSRx%2FiycpoDlLhkBwgxFH7h2BC94mIgT5fufqg1OUYConhFOxIuFZ%2FGVBCn0eZWUTigGnHCc9XAetoMd8EWZ9NEK8lcUSFVVYqxlVwi4hU6%2BAf4TWxUyrYdcATxSyOXNSDY22dBaOMICi7DPZr3AwR0FkBzhF%2F0vnmv6Pq6452uYLSBB21ZNTkEm8VLVbhqlb4748z8eb&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230423T213731Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFBHDLLY5C%2F20230423%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=08b3b40d300d0e0395711ddd3650f81a393433ba21be15b6c5e776e79278fe58",
            "width": 100,
            "height": 100
          },
          "SMALL": {
            "url": "https://edamam-product-images.s3.amazonaws.com/web-img/041/04158b5869398c899942336274f0e0f7-m.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQCJQIhC4qkNQMT%2BsfZBBM6imfSCbhc00qVjzyisP5jbTQIgXMqQdGGlAXZiff%2BGvNSrIr36AHleRUl%2BGIfUD8bwygEqwgUI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDM3sys8nakzofhDwXiqWBccYz0YciF5X1grIj6gaZZuBtpTjI9IkWAubjd7sTVJlYoexV87XA%2FB87TzPV%2FfI2zqHVQy2GpGfkVwL3Ly1qnOQ2BpRk4flwSjo0yHTDkksTs%2BXD8v2KCAUwqUxYGaM7sPQkQC32Q060ESB%2BOBIAhD1ssM%2F5b8mCPiFQw2bgGD5m6B5lFjvhrJESgb9QibQZL8I0zmfFxsz5c5f3G2mMzKoq6lEj5mdozARyAAAJ5G0Kilhlc4g%2F11N5dtj92wp1xPXsKriknz3XtezFsj%2F0v0Tq0ExabUWLJ8f1C8e%2B8c21ncWf5U1cAIfgBQ9PmOEdduFwfXIdZssJ%2FU%2FGb%2BHMP4QS0azQGD0yXjcSjunbuguH%2Bea0E3C2lFcbVgtG%2BgY7S9J5k7dCBtYgAYReml1QtxfSucUeSxSIp8giBjBj0JPr9kvpzxk6TggV%2BZCc3grqQuouJ%2FIm6AXrokvVxm7esnuj7XhmLDdPta8NlLL9o0yz1x9kWA%2Be9EvQebBY%2BhPdSOAkpdaR5M8i7LNpYwnF1QKmX2e7eIl1zxkq3DcjQqaBcpGREQV3s3u8MwXgs0z5oADHuleswS%2FMQUjZFzvoIRMr57rW7RSFCY3beAT2twX%2FpxxzwDUCMjiyGHSKoi1FSlXO6ho7jibg2P%2FOsO2u7gzUev%2B0CE5KWUPYvlCXrT%2Bd30UvGrzhpwOavbrdZ5Cnk21nv1o6CIfE0ZBeSu7ko8X07HbMZ%2ByT9kewIecODZ9I%2Ft7Df5%2B4VdvrHrqBfTBvtO4MVee16JAorw%2FmolH7iVsgprBx0W1oiwEIwTVoZje1YrDPah%2FbOrqP9BpK3XKCPhaSDh3LBbrBDruK%2F1SGg0zMjzaRsR%2Bd80ZfeIrv71uxFDFaPQoMO%2BklqIGOrEBIXOcU5WqFpqOnHohJ6zsIdyW2cDKsUOjo%2BxSSRx%2FiycpoDlLhkBwgxFH7h2BC94mIgT5fufqg1OUYConhFOxIuFZ%2FGVBCn0eZWUTigGnHCc9XAetoMd8EWZ9NEK8lcUSFVVYqxlVwi4hU6%2BAf4TWxUyrYdcATxSyOXNSDY22dBaOMICi7DPZr3AwR0FkBzhF%2F0vnmv6Pq6452uYLSBB21ZNTkEm8VLVbhqlb4748z8eb&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230423T213731Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFBHDLLY5C%2F20230423%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=a13c11bed4fbe45572ed3aa4d17bf0da68641b5ba80dce156972c3ba617a7a50",
            "width": 200,
            "height": 200
          },
          "REGULAR": {
            "url": "https://edamam-product-images.s3.amazonaws.com/web-img/041/04158b5869398c899942336274f0e0f7.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQCJQIhC4qkNQMT%2BsfZBBM6imfSCbhc00qVjzyisP5jbTQIgXMqQdGGlAXZiff%2BGvNSrIr36AHleRUl%2BGIfUD8bwygEqwgUI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDM3sys8nakzofhDwXiqWBccYz0YciF5X1grIj6gaZZuBtpTjI9IkWAubjd7sTVJlYoexV87XA%2FB87TzPV%2FfI2zqHVQy2GpGfkVwL3Ly1qnOQ2BpRk4flwSjo0yHTDkksTs%2BXD8v2KCAUwqUxYGaM7sPQkQC32Q060ESB%2BOBIAhD1ssM%2F5b8mCPiFQw2bgGD5m6B5lFjvhrJESgb9QibQZL8I0zmfFxsz5c5f3G2mMzKoq6lEj5mdozARyAAAJ5G0Kilhlc4g%2F11N5dtj92wp1xPXsKriknz3XtezFsj%2F0v0Tq0ExabUWLJ8f1C8e%2B8c21ncWf5U1cAIfgBQ9PmOEdduFwfXIdZssJ%2FU%2FGb%2BHMP4QS0azQGD0yXjcSjunbuguH%2Bea0E3C2lFcbVgtG%2BgY7S9J5k7dCBtYgAYReml1QtxfSucUeSxSIp8giBjBj0JPr9kvpzxk6TggV%2BZCc3grqQuouJ%2FIm6AXrokvVxm7esnuj7XhmLDdPta8NlLL9o0yz1x9kWA%2Be9EvQebBY%2BhPdSOAkpdaR5M8i7LNpYwnF1QKmX2e7eIl1zxkq3DcjQqaBcpGREQV3s3u8MwXgs0z5oADHuleswS%2FMQUjZFzvoIRMr57rW7RSFCY3beAT2twX%2FpxxzwDUCMjiyGHSKoi1FSlXO6ho7jibg2P%2FOsO2u7gzUev%2B0CE5KWUPYvlCXrT%2Bd30UvGrzhpwOavbrdZ5Cnk21nv1o6CIfE0ZBeSu7ko8X07HbMZ%2ByT9kewIecODZ9I%2Ft7Df5%2B4VdvrHrqBfTBvtO4MVee16JAorw%2FmolH7iVsgprBx0W1oiwEIwTVoZje1YrDPah%2FbOrqP9BpK3XKCPhaSDh3LBbrBDruK%2F1SGg0zMjzaRsR%2Bd80ZfeIrv71uxFDFaPQoMO%2BklqIGOrEBIXOcU5WqFpqOnHohJ6zsIdyW2cDKsUOjo%2BxSSRx%2FiycpoDlLhkBwgxFH7h2BC94mIgT5fufqg1OUYConhFOxIuFZ%2FGVBCn0eZWUTigGnHCc9XAetoMd8EWZ9NEK8lcUSFVVYqxlVwi4hU6%2BAf4TWxUyrYdcATxSyOXNSDY22dBaOMICi7DPZr3AwR0FkBzhF%2F0vnmv6Pq6452uYLSBB21ZNTkEm8VLVbhqlb4748z8eb&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230423T213731Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFBHDLLY5C%2F20230423%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=59607d6111e02a7624ba6aebef5e829b88f0c472ea301922f1cba6a0f002f21f",
            "width": 300,
            "height": 300
          }
        },
        "source": "Serious Eats",
        "url": "http://www.seriouseats.com/recipes/2012/10/naomi-duguids-fried-noodles.html",
        "shareAs": "http://www.edamam.com/recipe/naomi-duguid-s-fried-noodles-bbfc1a248bd6fe277e35fe01027de91f/-",
        "yield": 2,
        "dietLabels": [
          "Balanced",
          "Low-Sodium"
        ],
        "healthLabels": [
          "Sugar-Conscious",
          "Low Potassium",
          "Kidney-Friendly",
          "Vegetarian",
          "Pescatarian",
          "Dairy-Free",
          "Tree-Nut-Free",
          "Soy-Free",
          "Fish-Free",
          "Shellfish-Free",
          "Pork-Free",
          "Red-Meat-Free",
          "Crustacean-Free",
          "Celery-Free",
          "Mustard-Free",
          "Sesame-Free",
          "Lupine-Free",
          "Mollusk-Free",
          "Alcohol-Free",
          "Sulfite-Free",
          "Kosher"
        ],
        "cautions": [],
        "ingredientLines": [
          "1 cup dried egg noodles",
          "Peanut oil, for frying"
        ],
        "ingredients": [
          {
            "text": "1 cup dried egg noodles",
            "quantity": 1,
            "measure": "cup",
            "food": "egg noodles",
            "weight": 38,
            "foodCategory": "grains",
            "foodId": "food_aefg3gqa71nrtpbhjfo3yb36kd81",
            "image": "https://www.edamam.com/food-img/800/800c9c0d7cef6b5474723682ffa2878d.jpg"
          },
          {
            "text": "Peanut oil, for frying",
            "quantity": 0,
            "measure": null,
            "food": "Peanut oil",
            "weight": 0.5167999999999999,
            "foodCategory": "Oils",
            "foodId": "food_ackj525b2vo905bisrwjabfanm5t",
            "image": "https://www.edamam.com/food-img/827/82725f6b015e75a059ba2569c768eb68.jpg"
          }
        ],
        "calories": 196.30800000000002,
        "totalWeight": 43.7,
        "totalTime": 20,
        "cuisineType": [
          "asian"
        ],
        "mealType": [
          "lunch/dinner"
        ],
        "dishType": [
          "main course"
        ],
        "totalNutrients": {
          "ENERC_KCAL": {
            "label": "Energy",
            "quantity": 196.30800000000002,
            "unit": "kcal"
          },
          "FAT": {
            "label": "Fat",
            "quantity": 7.3872,
            "unit": "g"
          },
          "FASAT": {
            "label": "Saturated",
            "quantity": 1.4117,
            "unit": "g"
          },
          "FATRN": {
            "label": "Trans",
            "quantity": 0.02318,
            "unit": "g"
          },
          "FAMS": {
            "label": "Monounsaturated",
            "quantity": 3.1091600000000006,
            "unit": "g"
          },
          "FAPU": {
            "label": "Polyunsaturated",
            "quantity": 2.32978,
            "unit": "g"
          },
          "CHOCDF": {
            "label": "Carbs",
            "quantity": 27.0826,
            "unit": "g"
          },
          "CHOCDF.net": {
            "label": "Carbohydrates (net)",
            "quantity": 25.828599999999998,
            "unit": "g"
          },
          "FIBTG": {
            "label": "Fiber",
            "quantity": 1.254,
            "unit": "g"
          },
          "SUGAR": {
            "label": "Sugars",
            "quantity": 0.7143999999999999,
            "unit": "g"
          },
          "SUGAR.added": {
            "label": "Sugars, added",
            "quantity": 0,
            "unit": "g"
          },
          "PROCNT": {
            "label": "Protein",
            "quantity": 5.3808,
            "unit": "g"
          },
          "CHOLE": {
            "label": "Cholesterol",
            "quantity": 31.92,
            "unit": "mg"
          },
          "NA": {
            "label": "Sodium",
            "quantity": 7.98,
            "unit": "mg"
          },
          "CA": {
            "label": "Calcium",
            "quantity": 13.3,
            "unit": "mg"
          },
          "MG": {
            "label": "Magnesium",
            "quantity": 22.04,
            "unit": "mg"
          },
          "K": {
            "label": "Potassium",
            "quantity": 92.72,
            "unit": "mg"
          },
          "FE": {
            "label": "Iron",
            "quantity": 1.5255100000000001,
            "unit": "mg"
          },
          "ZN": {
            "label": "Zinc",
            "quantity": 0.73017,
            "unit": "mg"
          },
          "P": {
            "label": "Phosphorus",
            "quantity": 91.58,
            "unit": "mg"
          },
          "VITA_RAE": {
            "label": "Vitamin A",
            "quantity": 6.46,
            "unit": "µg"
          },
          "VITC": {
            "label": "Vitamin C",
            "quantity": 0,
            "unit": "mg"
          },
          "THIA": {
            "label": "Thiamin (B1)",
            "quantity": 0.43054000000000003,
            "unit": "mg"
          },
          "RIBF": {
            "label": "Riboflavin (B2)",
            "quantity": 0.16188,
            "unit": "mg"
          },
          "NIA": {
            "label": "Niacin (B3)",
            "quantity": 3.1870600000000002,
            "unit": "mg"
          },
          "VITB6A": {
            "label": "Vitamin B6",
            "quantity": 0.08208,
            "unit": "mg"
          },
          "FOLDFE": {
            "label": "Folate equivalent (total)",
            "quantity": 140.6,
            "unit": "µg"
          },
          "FOLFD": {
            "label": "Folate (food)",
            "quantity": 11.02,
            "unit": "µg"
          },
          "FOLAC": {
            "label": "Folic acid",
            "quantity": 76.38,
            "unit": "µg"
          },
          "VITB12": {
            "label": "Vitamin B12",
            "quantity": 0.11019999999999999,
            "unit": "µg"
          },
          "VITD": {
            "label": "Vitamin D",
            "quantity": 0.11399999999999999,
            "unit": "µg"
          },
          "TOCPHA": {
            "label": "Vitamin E",
            "quantity": 1.03493,
            "unit": "mg"
          },
          "VITK1": {
            "label": "Vitamin K",
            "quantity": 0.2299,
            "unit": "µg"
          },
          "Sugar.alcohol": {
            "label": "Sugar alcohol",
            "quantity": 0,
            "unit": "g"
          },
          "WATER": {
            "label": "Water",
            "quantity": 3.4238,
            "unit": "g"
          }
        },
        "totalDaily": {
          "ENERC_KCAL": {
            "label": "Energy",
            "quantity": 9.815400000000002,
            "unit": "%"
          },
          "FAT": {
            "label": "Fat",
            "quantity": 11.364923076923077,
            "unit": "%"
          },
          "FASAT": {
            "label": "Saturated",
            "quantity": 7.0584999999999996,
            "unit": "%"
          },
          "CHOCDF": {
            "label": "Carbs",
            "quantity": 9.027533333333333,
            "unit": "%"
          },
          "FIBTG": {
            "label": "Fiber",
            "quantity": 5.016,
            "unit": "%"
          },
          "PROCNT": {
            "label": "Protein",
            "quantity": 10.761599999999998,
            "unit": "%"
          },
          "CHOLE": {
            "label": "Cholesterol",
            "quantity": 10.64,
            "unit": "%"
          },
          "NA": {
            "label": "Sodium",
            "quantity": 0.3325,
            "unit": "%"
          },
          "CA": {
            "label": "Calcium",
            "quantity": 1.33,
            "unit": "%"
          },
          "MG": {
            "label": "Magnesium",
            "quantity": 5.247619047619048,
            "unit": "%"
          },
          "K": {
            "label": "Potassium",
            "quantity": 1.9727659574468086,
            "unit": "%"
          },
          "FE": {
            "label": "Iron",
            "quantity": 8.475055555555556,
            "unit": "%"
          },
          "ZN": {
            "label": "Zinc",
            "quantity": 6.6379090909090905,
            "unit": "%"
          },
          "P": {
            "label": "Phosphorus",
            "quantity": 13.082857142857144,
            "unit": "%"
          },
          "VITA_RAE": {
            "label": "Vitamin A",
            "quantity": 0.7177777777777777,
            "unit": "%"
          },
          "VITC": {
            "label": "Vitamin C",
            "quantity": 0,
            "unit": "%"
          },
          "THIA": {
            "label": "Thiamin (B1)",
            "quantity": 35.87833333333334,
            "unit": "%"
          },
          "RIBF": {
            "label": "Riboflavin (B2)",
            "quantity": 12.452307692307691,
            "unit": "%"
          },
          "NIA": {
            "label": "Niacin (B3)",
            "quantity": 19.919125,
            "unit": "%"
          },
          "VITB6A": {
            "label": "Vitamin B6",
            "quantity": 6.313846153846153,
            "unit": "%"
          },
          "FOLDFE": {
            "label": "Folate equivalent (total)",
            "quantity": 35.15,
            "unit": "%"
          },
          "VITB12": {
            "label": "Vitamin B12",
            "quantity": 4.591666666666667,
            "unit": "%"
          },
          "VITD": {
            "label": "Vitamin D",
            "quantity": 0.7599999999999999,
            "unit": "%"
          },
          "TOCPHA": {
            "label": "Vitamin E",
            "quantity": 6.899533333333333,
            "unit": "%"
          },
          "VITK1": {
            "label": "Vitamin K",
            "quantity": 0.19158333333333333,
            "unit": "%"
          }
        },
        "digest": [
          {
            "label": "Fat",
            "tag": "FAT",
            "schemaOrgTag": "fatContent",
            "total": 7.3872,
            "hasRDI": true,
            "daily": 11.364923076923077,
            "unit": "g",
            "sub": [
              {
                "label": "Saturated",
                "tag": "FASAT",
                "schemaOrgTag": "saturatedFatContent",
                "total": 1.4117,
                "hasRDI": true,
                "daily": 7.0584999999999996,
                "unit": "g"
              },
              {
                "label": "Trans",
                "tag": "FATRN",
                "schemaOrgTag": "transFatContent",
                "total": 0.02318,
                "hasRDI": false,
                "daily": 0,
                "unit": "g"
              },
              {
                "label": "Monounsaturated",
                "tag": "FAMS",
                "schemaOrgTag": null,
                "total": 3.1091600000000006,
                "hasRDI": false,
                "daily": 0,
                "unit": "g"
              },
              {
                "label": "Polyunsaturated",
                "tag": "FAPU",
                "schemaOrgTag": null,
                "total": 2.32978,
                "hasRDI": false,
                "daily": 0,
                "unit": "g"
              }
            ]
          },
          {
            "label": "Carbs",
            "tag": "CHOCDF",
            "schemaOrgTag": "carbohydrateContent",
            "total": 27.0826,
            "hasRDI": true,
            "daily": 9.027533333333333,
            "unit": "g",
            "sub": [
              {
                "label": "Carbs (net)",
                "tag": "CHOCDF.net",
                "schemaOrgTag": null,
                "total": 25.828599999999998,
                "hasRDI": false,
                "daily": 0,
                "unit": "g"
              },
              {
                "label": "Fiber",
                "tag": "FIBTG",
                "schemaOrgTag": "fiberContent",
                "total": 1.254,
                "hasRDI": true,
                "daily": 5.016,
                "unit": "g"
              },
              {
                "label": "Sugars",
                "tag": "SUGAR",
                "schemaOrgTag": "sugarContent",
                "total": 0.7143999999999999,
                "hasRDI": false,
                "daily": 0,
                "unit": "g"
              },
              {
                "label": "Sugars, added",
                "tag": "SUGAR.added",
                "schemaOrgTag": null,
                "total": 0,
                "hasRDI": false,
                "daily": 0,
                "unit": "g"
              }
            ]
          },
          {
            "label": "Protein",
            "tag": "PROCNT",
            "schemaOrgTag": "proteinContent",
            "total": 5.3808,
            "hasRDI": true,
            "daily": 10.761599999999998,
            "unit": "g"
          },
          {
            "label": "Cholesterol",
            "tag": "CHOLE",
            "schemaOrgTag": "cholesterolContent",
            "total": 31.92,
            "hasRDI": true,
            "daily": 10.64,
            "unit": "mg"
          },
          {
            "label": "Sodium",
            "tag": "NA",
            "schemaOrgTag": "sodiumContent",
            "total": 7.98,
            "hasRDI": true,
            "daily": 0.3325,
            "unit": "mg"
          },
          {
            "label": "Calcium",
            "tag": "CA",
            "schemaOrgTag": null,
            "total": 13.3,
            "hasRDI": true,
            "daily": 1.33,
            "unit": "mg"
          },
          {
            "label": "Magnesium",
            "tag": "MG",
            "schemaOrgTag": null,
            "total": 22.04,
            "hasRDI": true,
            "daily": 5.247619047619048,
            "unit": "mg"
          },
          {
            "label": "Potassium",
            "tag": "K",
            "schemaOrgTag": null,
            "total": 92.72,
            "hasRDI": true,
            "daily": 1.9727659574468086,
            "unit": "mg"
          },
          {
            "label": "Iron",
            "tag": "FE",
            "schemaOrgTag": null,
            "total": 1.5255100000000001,
            "hasRDI": true,
            "daily": 8.475055555555556,
            "unit": "mg"
          },
          {
            "label": "Zinc",
            "tag": "ZN",
            "schemaOrgTag": null,
            "total": 0.73017,
            "hasRDI": true,
            "daily": 6.6379090909090905,
            "unit": "mg"
          },
          {
            "label": "Phosphorus",
            "tag": "P",
            "schemaOrgTag": null,
            "total": 91.58,
            "hasRDI": true,
            "daily": 13.082857142857144,
            "unit": "mg"
          },
          {
            "label": "Vitamin A",
            "tag": "VITA_RAE",
            "schemaOrgTag": null,
            "total": 6.46,
            "hasRDI": true,
            "daily": 0.7177777777777777,
            "unit": "µg"
          },
          {
            "label": "Vitamin C",
            "tag": "VITC",
            "schemaOrgTag": null,
            "total": 0,
            "hasRDI": true,
            "daily": 0,
            "unit": "mg"
          },
          {
            "label": "Thiamin (B1)",
            "tag": "THIA",
            "schemaOrgTag": null,
            "total": 0.43054000000000003,
            "hasRDI": true,
            "daily": 35.87833333333334,
            "unit": "mg"
          },
          {
            "label": "Riboflavin (B2)",
            "tag": "RIBF",
            "schemaOrgTag": null,
            "total": 0.16188,
            "hasRDI": true,
            "daily": 12.452307692307691,
            "unit": "mg"
          },
          {
            "label": "Niacin (B3)",
            "tag": "NIA",
            "schemaOrgTag": null,
            "total": 3.1870600000000002,
            "hasRDI": true,
            "daily": 19.919125,
            "unit": "mg"
          },
          {
            "label": "Vitamin B6",
            "tag": "VITB6A",
            "schemaOrgTag": null,
            "total": 0.08208,
            "hasRDI": true,
            "daily": 6.313846153846153,
            "unit": "mg"
          },
          {
            "label": "Folate equivalent (total)",
            "tag": "FOLDFE",
            "schemaOrgTag": null,
            "total": 140.6,
            "hasRDI": true,
            "daily": 35.15,
            "unit": "µg"
          },
          {
            "label": "Folate (food)",
            "tag": "FOLFD",
            "schemaOrgTag": null,
            "total": 11.02,
            "hasRDI": false,
            "daily": 0,
            "unit": "µg"
          },
          {
            "label": "Folic acid",
            "tag": "FOLAC",
            "schemaOrgTag": null,
            "total": 76.38,
            "hasRDI": false,
            "daily": 0,
            "unit": "µg"
          },
          {
            "label": "Vitamin B12",
            "tag": "VITB12",
            "schemaOrgTag": null,
            "total": 0.11019999999999999,
            "hasRDI": true,
            "daily": 4.591666666666667,
            "unit": "µg"
          },
          {
            "label": "Vitamin D",
            "tag": "VITD",
            "schemaOrgTag": null,
            "total": 0.11399999999999999,
            "hasRDI": true,
            "daily": 0.7599999999999999,
            "unit": "µg"
          },
          {
            "label": "Vitamin E",
            "tag": "TOCPHA",
            "schemaOrgTag": null,
            "total": 1.03493,
            "hasRDI": true,
            "daily": 6.899533333333333,
            "unit": "mg"
          },
          {
            "label": "Vitamin K",
            "tag": "VITK1",
            "schemaOrgTag": null,
            "total": 0.2299,
            "hasRDI": true,
            "daily": 0.19158333333333333,
            "unit": "µg"
          },
          {
            "label": "Sugar alcohols",
            "tag": "Sugar.alcohol",
            "schemaOrgTag": null,
            "total": 0,
            "hasRDI": false,
            "daily": 0,
            "unit": "g"
          },
          {
            "label": "Water",
            "tag": "WATER",
            "schemaOrgTag": null,
            "total": 3.4238,
            "hasRDI": false,
            "daily": 0,
            "unit": "g"
          }
        ]
      },
      "_links": {
        "self": {
          "title": "Self",
          "href": "https://api.edamam.com/api/recipes/v2/bbfc1a248bd6fe277e35fe01027de91f?type=public&app_id=19c82497&app_key=f7ce5672f67e97572eed94fb0984eeda"
        }
      }
    },
    {
      "recipe": {
        "uri": "http://www.edamam.com/ontologies/edamam.owl#recipe_84b8126a7e5c3ceea9dcaee0f4d8df00",
        "label": "Strawberry Vodka",
        "image": "https://edamam-product-images.s3.amazonaws.com/web-img/018/018c94e42ca9816d6800e22e1d967906.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQCJQIhC4qkNQMT%2BsfZBBM6imfSCbhc00qVjzyisP5jbTQIgXMqQdGGlAXZiff%2BGvNSrIr36AHleRUl%2BGIfUD8bwygEqwgUI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDM3sys8nakzofhDwXiqWBccYz0YciF5X1grIj6gaZZuBtpTjI9IkWAubjd7sTVJlYoexV87XA%2FB87TzPV%2FfI2zqHVQy2GpGfkVwL3Ly1qnOQ2BpRk4flwSjo0yHTDkksTs%2BXD8v2KCAUwqUxYGaM7sPQkQC32Q060ESB%2BOBIAhD1ssM%2F5b8mCPiFQw2bgGD5m6B5lFjvhrJESgb9QibQZL8I0zmfFxsz5c5f3G2mMzKoq6lEj5mdozARyAAAJ5G0Kilhlc4g%2F11N5dtj92wp1xPXsKriknz3XtezFsj%2F0v0Tq0ExabUWLJ8f1C8e%2B8c21ncWf5U1cAIfgBQ9PmOEdduFwfXIdZssJ%2FU%2FGb%2BHMP4QS0azQGD0yXjcSjunbuguH%2Bea0E3C2lFcbVgtG%2BgY7S9J5k7dCBtYgAYReml1QtxfSucUeSxSIp8giBjBj0JPr9kvpzxk6TggV%2BZCc3grqQuouJ%2FIm6AXrokvVxm7esnuj7XhmLDdPta8NlLL9o0yz1x9kWA%2Be9EvQebBY%2BhPdSOAkpdaR5M8i7LNpYwnF1QKmX2e7eIl1zxkq3DcjQqaBcpGREQV3s3u8MwXgs0z5oADHuleswS%2FMQUjZFzvoIRMr57rW7RSFCY3beAT2twX%2FpxxzwDUCMjiyGHSKoi1FSlXO6ho7jibg2P%2FOsO2u7gzUev%2B0CE5KWUPYvlCXrT%2Bd30UvGrzhpwOavbrdZ5Cnk21nv1o6CIfE0ZBeSu7ko8X07HbMZ%2ByT9kewIecODZ9I%2Ft7Df5%2B4VdvrHrqBfTBvtO4MVee16JAorw%2FmolH7iVsgprBx0W1oiwEIwTVoZje1YrDPah%2FbOrqP9BpK3XKCPhaSDh3LBbrBDruK%2F1SGg0zMjzaRsR%2Bd80ZfeIrv71uxFDFaPQoMO%2BklqIGOrEBIXOcU5WqFpqOnHohJ6zsIdyW2cDKsUOjo%2BxSSRx%2FiycpoDlLhkBwgxFH7h2BC94mIgT5fufqg1OUYConhFOxIuFZ%2FGVBCn0eZWUTigGnHCc9XAetoMd8EWZ9NEK8lcUSFVVYqxlVwi4hU6%2BAf4TWxUyrYdcATxSyOXNSDY22dBaOMICi7DPZr3AwR0FkBzhF%2F0vnmv6Pq6452uYLSBB21ZNTkEm8VLVbhqlb4748z8eb&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230423T213731Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFBHDLLY5C%2F20230423%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=90f142d3e733d0ac80f9c0908a84196fb584c3d9978820a3863592245eac04d7",
        "images": {
          "THUMBNAIL": {
            "url": "https://edamam-product-images.s3.amazonaws.com/web-img/018/018c94e42ca9816d6800e22e1d967906-s.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQCJQIhC4qkNQMT%2BsfZBBM6imfSCbhc00qVjzyisP5jbTQIgXMqQdGGlAXZiff%2BGvNSrIr36AHleRUl%2BGIfUD8bwygEqwgUI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDM3sys8nakzofhDwXiqWBccYz0YciF5X1grIj6gaZZuBtpTjI9IkWAubjd7sTVJlYoexV87XA%2FB87TzPV%2FfI2zqHVQy2GpGfkVwL3Ly1qnOQ2BpRk4flwSjo0yHTDkksTs%2BXD8v2KCAUwqUxYGaM7sPQkQC32Q060ESB%2BOBIAhD1ssM%2F5b8mCPiFQw2bgGD5m6B5lFjvhrJESgb9QibQZL8I0zmfFxsz5c5f3G2mMzKoq6lEj5mdozARyAAAJ5G0Kilhlc4g%2F11N5dtj92wp1xPXsKriknz3XtezFsj%2F0v0Tq0ExabUWLJ8f1C8e%2B8c21ncWf5U1cAIfgBQ9PmOEdduFwfXIdZssJ%2FU%2FGb%2BHMP4QS0azQGD0yXjcSjunbuguH%2Bea0E3C2lFcbVgtG%2BgY7S9J5k7dCBtYgAYReml1QtxfSucUeSxSIp8giBjBj0JPr9kvpzxk6TggV%2BZCc3grqQuouJ%2FIm6AXrokvVxm7esnuj7XhmLDdPta8NlLL9o0yz1x9kWA%2Be9EvQebBY%2BhPdSOAkpdaR5M8i7LNpYwnF1QKmX2e7eIl1zxkq3DcjQqaBcpGREQV3s3u8MwXgs0z5oADHuleswS%2FMQUjZFzvoIRMr57rW7RSFCY3beAT2twX%2FpxxzwDUCMjiyGHSKoi1FSlXO6ho7jibg2P%2FOsO2u7gzUev%2B0CE5KWUPYvlCXrT%2Bd30UvGrzhpwOavbrdZ5Cnk21nv1o6CIfE0ZBeSu7ko8X07HbMZ%2ByT9kewIecODZ9I%2Ft7Df5%2B4VdvrHrqBfTBvtO4MVee16JAorw%2FmolH7iVsgprBx0W1oiwEIwTVoZje1YrDPah%2FbOrqP9BpK3XKCPhaSDh3LBbrBDruK%2F1SGg0zMjzaRsR%2Bd80ZfeIrv71uxFDFaPQoMO%2BklqIGOrEBIXOcU5WqFpqOnHohJ6zsIdyW2cDKsUOjo%2BxSSRx%2FiycpoDlLhkBwgxFH7h2BC94mIgT5fufqg1OUYConhFOxIuFZ%2FGVBCn0eZWUTigGnHCc9XAetoMd8EWZ9NEK8lcUSFVVYqxlVwi4hU6%2BAf4TWxUyrYdcATxSyOXNSDY22dBaOMICi7DPZr3AwR0FkBzhF%2F0vnmv6Pq6452uYLSBB21ZNTkEm8VLVbhqlb4748z8eb&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230423T213731Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFBHDLLY5C%2F20230423%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=200ccf0ffce65ff74f1346dc69f49412c450bb20299d228698fe5561aaac9fac",
            "width": 100,
            "height": 100
          },
          "SMALL": {
            "url": "https://edamam-product-images.s3.amazonaws.com/web-img/018/018c94e42ca9816d6800e22e1d967906-m.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQCJQIhC4qkNQMT%2BsfZBBM6imfSCbhc00qVjzyisP5jbTQIgXMqQdGGlAXZiff%2BGvNSrIr36AHleRUl%2BGIfUD8bwygEqwgUI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDM3sys8nakzofhDwXiqWBccYz0YciF5X1grIj6gaZZuBtpTjI9IkWAubjd7sTVJlYoexV87XA%2FB87TzPV%2FfI2zqHVQy2GpGfkVwL3Ly1qnOQ2BpRk4flwSjo0yHTDkksTs%2BXD8v2KCAUwqUxYGaM7sPQkQC32Q060ESB%2BOBIAhD1ssM%2F5b8mCPiFQw2bgGD5m6B5lFjvhrJESgb9QibQZL8I0zmfFxsz5c5f3G2mMzKoq6lEj5mdozARyAAAJ5G0Kilhlc4g%2F11N5dtj92wp1xPXsKriknz3XtezFsj%2F0v0Tq0ExabUWLJ8f1C8e%2B8c21ncWf5U1cAIfgBQ9PmOEdduFwfXIdZssJ%2FU%2FGb%2BHMP4QS0azQGD0yXjcSjunbuguH%2Bea0E3C2lFcbVgtG%2BgY7S9J5k7dCBtYgAYReml1QtxfSucUeSxSIp8giBjBj0JPr9kvpzxk6TggV%2BZCc3grqQuouJ%2FIm6AXrokvVxm7esnuj7XhmLDdPta8NlLL9o0yz1x9kWA%2Be9EvQebBY%2BhPdSOAkpdaR5M8i7LNpYwnF1QKmX2e7eIl1zxkq3DcjQqaBcpGREQV3s3u8MwXgs0z5oADHuleswS%2FMQUjZFzvoIRMr57rW7RSFCY3beAT2twX%2FpxxzwDUCMjiyGHSKoi1FSlXO6ho7jibg2P%2FOsO2u7gzUev%2B0CE5KWUPYvlCXrT%2Bd30UvGrzhpwOavbrdZ5Cnk21nv1o6CIfE0ZBeSu7ko8X07HbMZ%2ByT9kewIecODZ9I%2Ft7Df5%2B4VdvrHrqBfTBvtO4MVee16JAorw%2FmolH7iVsgprBx0W1oiwEIwTVoZje1YrDPah%2FbOrqP9BpK3XKCPhaSDh3LBbrBDruK%2F1SGg0zMjzaRsR%2Bd80ZfeIrv71uxFDFaPQoMO%2BklqIGOrEBIXOcU5WqFpqOnHohJ6zsIdyW2cDKsUOjo%2BxSSRx%2FiycpoDlLhkBwgxFH7h2BC94mIgT5fufqg1OUYConhFOxIuFZ%2FGVBCn0eZWUTigGnHCc9XAetoMd8EWZ9NEK8lcUSFVVYqxlVwi4hU6%2BAf4TWxUyrYdcATxSyOXNSDY22dBaOMICi7DPZr3AwR0FkBzhF%2F0vnmv6Pq6452uYLSBB21ZNTkEm8VLVbhqlb4748z8eb&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230423T213731Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFBHDLLY5C%2F20230423%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=2cf3ebf3b3a79eaf24e0f82c8855946fdae76002b0c1464d1387955865eca0d1",
            "width": 200,
            "height": 200
          },
          "REGULAR": {
            "url": "https://edamam-product-images.s3.amazonaws.com/web-img/018/018c94e42ca9816d6800e22e1d967906.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQCJQIhC4qkNQMT%2BsfZBBM6imfSCbhc00qVjzyisP5jbTQIgXMqQdGGlAXZiff%2BGvNSrIr36AHleRUl%2BGIfUD8bwygEqwgUI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDM3sys8nakzofhDwXiqWBccYz0YciF5X1grIj6gaZZuBtpTjI9IkWAubjd7sTVJlYoexV87XA%2FB87TzPV%2FfI2zqHVQy2GpGfkVwL3Ly1qnOQ2BpRk4flwSjo0yHTDkksTs%2BXD8v2KCAUwqUxYGaM7sPQkQC32Q060ESB%2BOBIAhD1ssM%2F5b8mCPiFQw2bgGD5m6B5lFjvhrJESgb9QibQZL8I0zmfFxsz5c5f3G2mMzKoq6lEj5mdozARyAAAJ5G0Kilhlc4g%2F11N5dtj92wp1xPXsKriknz3XtezFsj%2F0v0Tq0ExabUWLJ8f1C8e%2B8c21ncWf5U1cAIfgBQ9PmOEdduFwfXIdZssJ%2FU%2FGb%2BHMP4QS0azQGD0yXjcSjunbuguH%2Bea0E3C2lFcbVgtG%2BgY7S9J5k7dCBtYgAYReml1QtxfSucUeSxSIp8giBjBj0JPr9kvpzxk6TggV%2BZCc3grqQuouJ%2FIm6AXrokvVxm7esnuj7XhmLDdPta8NlLL9o0yz1x9kWA%2Be9EvQebBY%2BhPdSOAkpdaR5M8i7LNpYwnF1QKmX2e7eIl1zxkq3DcjQqaBcpGREQV3s3u8MwXgs0z5oADHuleswS%2FMQUjZFzvoIRMr57rW7RSFCY3beAT2twX%2FpxxzwDUCMjiyGHSKoi1FSlXO6ho7jibg2P%2FOsO2u7gzUev%2B0CE5KWUPYvlCXrT%2Bd30UvGrzhpwOavbrdZ5Cnk21nv1o6CIfE0ZBeSu7ko8X07HbMZ%2ByT9kewIecODZ9I%2Ft7Df5%2B4VdvrHrqBfTBvtO4MVee16JAorw%2FmolH7iVsgprBx0W1oiwEIwTVoZje1YrDPah%2FbOrqP9BpK3XKCPhaSDh3LBbrBDruK%2F1SGg0zMjzaRsR%2Bd80ZfeIrv71uxFDFaPQoMO%2BklqIGOrEBIXOcU5WqFpqOnHohJ6zsIdyW2cDKsUOjo%2BxSSRx%2FiycpoDlLhkBwgxFH7h2BC94mIgT5fufqg1OUYConhFOxIuFZ%2FGVBCn0eZWUTigGnHCc9XAetoMd8EWZ9NEK8lcUSFVVYqxlVwi4hU6%2BAf4TWxUyrYdcATxSyOXNSDY22dBaOMICi7DPZr3AwR0FkBzhF%2F0vnmv6Pq6452uYLSBB21ZNTkEm8VLVbhqlb4748z8eb&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230423T213731Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFBHDLLY5C%2F20230423%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=90f142d3e733d0ac80f9c0908a84196fb584c3d9978820a3863592245eac04d7",
            "width": 300,
            "height": 300
          }
        },
        "source": "David Lebovitz",
        "url": "http://www.davidlebovitz.com/strawberry-vodka-recipe-infusion/",
        "shareAs": "http://www.edamam.com/recipe/strawberry-vodka-84b8126a7e5c3ceea9dcaee0f4d8df00/-",
        "yield": 14,
        "dietLabels": [
          "Low-Fat",
          "Low-Sodium"
        ],
        "healthLabels": [
          "Sugar-Conscious",
          "Low Potassium",
          "Kidney-Friendly",
          "Keto-Friendly",
          "Vegan",
          "Vegetarian",
          "Pescatarian",
          "Paleo",
          "Mediterranean",
          "Dairy-Free",
          "Gluten-Free",
          "Wheat-Free",
          "Egg-Free",
          "Peanut-Free",
          "Tree-Nut-Free",
          "Soy-Free",
          "Fish-Free",
          "Shellfish-Free",
          "Pork-Free",
          "Red-Meat-Free",
          "Crustacean-Free",
          "Celery-Free",
          "Mustard-Free",
          "Sesame-Free",
          "Lupine-Free",
          "Mollusk-Free",
          "No oil added",
          "Sulfite-Free",
          "Kosher",
          "Alcohol-Cocktail"
        ],
        "cautions": [
          "Wheat",
          "Sulfites"
        ],
        "ingredientLines": [
          "One bottle (750ml) vodka",
          "2 pints (about 1 1/4 pounds, 575g) strawberries, organic or unsprayed"
        ],
        "ingredients": [
          {
            "text": "One bottle (750ml) vodka",
            "quantity": 750,
            "measure": "milliliter",
            "food": "vodka",
            "weight": 705.0223733334266,
            "foodCategory": "liquors and cocktails",
            "foodId": "food_aqnx4i8aieyph2athk58cb3cr69w",
            "image": "https://www.edamam.com/food-img/e1a/e1a4708099e89fdadeb81c2d95deaa34.jpg"
          },
          {
            "text": "2 pints (about 1 1/4 pounds, 575g) strawberries, organic or unsprayed",
            "quantity": 2,
            "measure": "pint",
            "food": "strawberries",
            "weight": 714,
            "foodCategory": "fruit",
            "foodId": "food_b4s2ibkbrrucmbabbaxhfau8ay42",
            "image": "https://www.edamam.com/food-img/00c/00c8851e401bf7975be7f73499b4b573.jpg"
          }
        ],
        "calories": 1857.0816824002154,
        "totalWeight": 1419.0223733334265,
        "totalTime": 36,
        "cuisineType": [
          "world"
        ],
        "mealType": [
          "lunch/dinner"
        ],
        "dishType": [
          "alcohol cocktail"
        ],
        "totalNutrients": {
          "ENERC_KCAL": {
            "label": "Energy",
            "quantity": 1857.0816824002154,
            "unit": "kcal"
          },
          "FAT": {
            "label": "Fat",
            "quantity": 2.142,
            "unit": "g"
          },
          "FASAT": {
            "label": "Saturated",
            "quantity": 0.1071,
            "unit": "g"
          },
          "FATRN": {
            "label": "Trans",
            "quantity": 0,
            "unit": "g"
          },
          "FAMS": {
            "label": "Monounsaturated",
            "quantity": 0.30702,
            "unit": "g"
          },
          "FAPU": {
            "label": "Polyunsaturated",
            "quantity": 1.1067,
            "unit": "g"
          },
          "CHOCDF": {
            "label": "Carbs",
            "quantity": 54.8352,
            "unit": "g"
          },
          "CHOCDF.net": {
            "label": "Carbohydrates (net)",
            "quantity": 40.5552,
            "unit": "g"
          },
          "FIBTG": {
            "label": "Fiber",
            "quantity": 14.280000000000001,
            "unit": "g"
          },
          "SUGAR": {
            "label": "Sugars",
            "quantity": 34.9146,
            "unit": "g"
          },
          "SUGAR.added": {
            "label": "Sugars, added",
            "quantity": 0,
            "unit": "g"
          },
          "PROCNT": {
            "label": "Protein",
            "quantity": 4.7838,
            "unit": "g"
          },
          "CHOLE": {
            "label": "Cholesterol",
            "quantity": 0,
            "unit": "mg"
          },
          "NA": {
            "label": "Sodium",
            "quantity": 14.190223733334266,
            "unit": "mg"
          },
          "CA": {
            "label": "Calcium",
            "quantity": 114.24000000000001,
            "unit": "mg"
          },
          "MG": {
            "label": "Magnesium",
            "quantity": 92.82000000000001,
            "unit": "mg"
          },
          "K": {
            "label": "Potassium",
            "quantity": 1099.4702237333343,
            "unit": "mg"
          },
          "FE": {
            "label": "Iron",
            "quantity": 2.9979022373333426,
            "unit": "mg"
          },
          "ZN": {
            "label": "Zinc",
            "quantity": 0.9996,
            "unit": "mg"
          },
          "P": {
            "label": "Phosphorus",
            "quantity": 206.61111866667136,
            "unit": "mg"
          },
          "VITA_RAE": {
            "label": "Vitamin A",
            "quantity": 7.140000000000001,
            "unit": "µg"
          },
          "VITC": {
            "label": "Vitamin C",
            "quantity": 419.832,
            "unit": "mg"
          },
          "THIA": {
            "label": "Thiamin (B1)",
            "quantity": 0.20661111866667134,
            "unit": "mg"
          },
          "RIBF": {
            "label": "Riboflavin (B2)",
            "quantity": 0.20643156613333985,
            "unit": "mg"
          },
          "NIA": {
            "label": "Niacin (B3)",
            "quantity": 2.7560400000000005,
            "unit": "mg"
          },
          "VITB6A": {
            "label": "Vitamin B6",
            "quantity": 0.33558000000000004,
            "unit": "mg"
          },
          "FOLDFE": {
            "label": "Folate equivalent (total)",
            "quantity": 171.36,
            "unit": "µg"
          },
          "FOLFD": {
            "label": "Folate (food)",
            "quantity": 171.36,
            "unit": "µg"
          },
          "FOLAC": {
            "label": "Folic acid",
            "quantity": 0,
            "unit": "µg"
          },
          "VITB12": {
            "label": "Vitamin B12",
            "quantity": 0,
            "unit": "µg"
          },
          "VITD": {
            "label": "Vitamin D",
            "quantity": 0,
            "unit": "µg"
          },
          "TOCPHA": {
            "label": "Vitamin E",
            "quantity": 2.0706,
            "unit": "mg"
          },
          "VITK1": {
            "label": "Vitamin K",
            "quantity": 15.708000000000002,
            "unit": "µg"
          },
          "Sugar.alcohol": {
            "label": "Sugar alcohol",
            "quantity": 0,
            "unit": "g"
          },
          "WATER": {
            "label": "Water",
            "quantity": 1118.927900640062,
            "unit": "g"
          }
        },
        "totalDaily": {
          "ENERC_KCAL": {
            "label": "Energy",
            "quantity": 92.85408412001077,
            "unit": "%"
          },
          "FAT": {
            "label": "Fat",
            "quantity": 3.295384615384615,
            "unit": "%"
          },
          "FASAT": {
            "label": "Saturated",
            "quantity": 0.5355000000000001,
            "unit": "%"
          },
          "CHOCDF": {
            "label": "Carbs",
            "quantity": 18.2784,
            "unit": "%"
          },
          "FIBTG": {
            "label": "Fiber",
            "quantity": 57.12,
            "unit": "%"
          },
          "PROCNT": {
            "label": "Protein",
            "quantity": 9.5676,
            "unit": "%"
          },
          "CHOLE": {
            "label": "Cholesterol",
            "quantity": 0,
            "unit": "%"
          },
          "NA": {
            "label": "Sodium",
            "quantity": 0.5912593222222611,
            "unit": "%"
          },
          "CA": {
            "label": "Calcium",
            "quantity": 11.424,
            "unit": "%"
          },
          "MG": {
            "label": "Magnesium",
            "quantity": 22.1,
            "unit": "%"
          },
          "K": {
            "label": "Potassium",
            "quantity": 23.392983483687964,
            "unit": "%"
          },
          "FE": {
            "label": "Iron",
            "quantity": 16.65501242962968,
            "unit": "%"
          },
          "ZN": {
            "label": "Zinc",
            "quantity": 9.087272727272728,
            "unit": "%"
          },
          "P": {
            "label": "Phosphorus",
            "quantity": 29.515874095238765,
            "unit": "%"
          },
          "VITA_RAE": {
            "label": "Vitamin A",
            "quantity": 0.7933333333333333,
            "unit": "%"
          },
          "VITC": {
            "label": "Vitamin C",
            "quantity": 466.47999999999996,
            "unit": "%"
          },
          "THIA": {
            "label": "Thiamin (B1)",
            "quantity": 17.217593222222614,
            "unit": "%"
          },
          "RIBF": {
            "label": "Riboflavin (B2)",
            "quantity": 15.879351241026143,
            "unit": "%"
          },
          "NIA": {
            "label": "Niacin (B3)",
            "quantity": 17.225250000000003,
            "unit": "%"
          },
          "VITB6A": {
            "label": "Vitamin B6",
            "quantity": 25.813846153846157,
            "unit": "%"
          },
          "FOLDFE": {
            "label": "Folate equivalent (total)",
            "quantity": 42.84,
            "unit": "%"
          },
          "VITB12": {
            "label": "Vitamin B12",
            "quantity": 0,
            "unit": "%"
          },
          "VITD": {
            "label": "Vitamin D",
            "quantity": 0,
            "unit": "%"
          },
          "TOCPHA": {
            "label": "Vitamin E",
            "quantity": 13.804000000000002,
            "unit": "%"
          },
          "VITK1": {
            "label": "Vitamin K",
            "quantity": 13.090000000000002,
            "unit": "%"
          }
        },
        "digest": [
          {
            "label": "Fat",
            "tag": "FAT",
            "schemaOrgTag": "fatContent",
            "total": 2.142,
            "hasRDI": true,
            "daily": 3.295384615384615,
            "unit": "g",
            "sub": [
              {
                "label": "Saturated",
                "tag": "FASAT",
                "schemaOrgTag": "saturatedFatContent",
                "total": 0.1071,
                "hasRDI": true,
                "daily": 0.5355000000000001,
                "unit": "g"
              },
              {
                "label": "Trans",
                "tag": "FATRN",
                "schemaOrgTag": "transFatContent",
                "total": 0,
                "hasRDI": false,
                "daily": 0,
                "unit": "g"
              },
              {
                "label": "Monounsaturated",
                "tag": "FAMS",
                "schemaOrgTag": null,
                "total": 0.30702,
                "hasRDI": false,
                "daily": 0,
                "unit": "g"
              },
              {
                "label": "Polyunsaturated",
                "tag": "FAPU",
                "schemaOrgTag": null,
                "total": 1.1067,
                "hasRDI": false,
                "daily": 0,
                "unit": "g"
              }
            ]
          },
          {
            "label": "Carbs",
            "tag": "CHOCDF",
            "schemaOrgTag": "carbohydrateContent",
            "total": 54.8352,
            "hasRDI": true,
            "daily": 18.2784,
            "unit": "g",
            "sub": [
              {
                "label": "Carbs (net)",
                "tag": "CHOCDF.net",
                "schemaOrgTag": null,
                "total": 40.5552,
                "hasRDI": false,
                "daily": 0,
                "unit": "g"
              },
              {
                "label": "Fiber",
                "tag": "FIBTG",
                "schemaOrgTag": "fiberContent",
                "total": 14.280000000000001,
                "hasRDI": true,
                "daily": 57.12,
                "unit": "g"
              },
              {
                "label": "Sugars",
                "tag": "SUGAR",
                "schemaOrgTag": "sugarContent",
                "total": 34.9146,
                "hasRDI": false,
                "daily": 0,
                "unit": "g"
              },
              {
                "label": "Sugars, added",
                "tag": "SUGAR.added",
                "schemaOrgTag": null,
                "total": 0,
                "hasRDI": false,
                "daily": 0,
                "unit": "g"
              }
            ]
          },
          {
            "label": "Protein",
            "tag": "PROCNT",
            "schemaOrgTag": "proteinContent",
            "total": 4.7838,
            "hasRDI": true,
            "daily": 9.5676,
            "unit": "g"
          },
          {
            "label": "Cholesterol",
            "tag": "CHOLE",
            "schemaOrgTag": "cholesterolContent",
            "total": 0,
            "hasRDI": true,
            "daily": 0,
            "unit": "mg"
          },
          {
            "label": "Sodium",
            "tag": "NA",
            "schemaOrgTag": "sodiumContent",
            "total": 14.190223733334266,
            "hasRDI": true,
            "daily": 0.5912593222222611,
            "unit": "mg"
          },
          {
            "label": "Calcium",
            "tag": "CA",
            "schemaOrgTag": null,
            "total": 114.24000000000001,
            "hasRDI": true,
            "daily": 11.424,
            "unit": "mg"
          },
          {
            "label": "Magnesium",
            "tag": "MG",
            "schemaOrgTag": null,
            "total": 92.82000000000001,
            "hasRDI": true,
            "daily": 22.1,
            "unit": "mg"
          },
          {
            "label": "Potassium",
            "tag": "K",
            "schemaOrgTag": null,
            "total": 1099.4702237333343,
            "hasRDI": true,
            "daily": 23.392983483687964,
            "unit": "mg"
          },
          {
            "label": "Iron",
            "tag": "FE",
            "schemaOrgTag": null,
            "total": 2.9979022373333426,
            "hasRDI": true,
            "daily": 16.65501242962968,
            "unit": "mg"
          },
          {
            "label": "Zinc",
            "tag": "ZN",
            "schemaOrgTag": null,
            "total": 0.9996,
            "hasRDI": true,
            "daily": 9.087272727272728,
            "unit": "mg"
          },
          {
            "label": "Phosphorus",
            "tag": "P",
            "schemaOrgTag": null,
            "total": 206.61111866667136,
            "hasRDI": true,
            "daily": 29.515874095238765,
            "unit": "mg"
          },
          {
            "label": "Vitamin A",
            "tag": "VITA_RAE",
            "schemaOrgTag": null,
            "total": 7.140000000000001,
            "hasRDI": true,
            "daily": 0.7933333333333333,
            "unit": "µg"
          },
          {
            "label": "Vitamin C",
            "tag": "VITC",
            "schemaOrgTag": null,
            "total": 419.832,
            "hasRDI": true,
            "daily": 466.47999999999996,
            "unit": "mg"
          },
          {
            "label": "Thiamin (B1)",
            "tag": "THIA",
            "schemaOrgTag": null,
            "total": 0.20661111866667134,
            "hasRDI": true,
            "daily": 17.217593222222614,
            "unit": "mg"
          },
          {
            "label": "Riboflavin (B2)",
            "tag": "RIBF",
            "schemaOrgTag": null,
            "total": 0.20643156613333985,
            "hasRDI": true,
            "daily": 15.879351241026143,
            "unit": "mg"
          },
          {
            "label": "Niacin (B3)",
            "tag": "NIA",
            "schemaOrgTag": null,
            "total": 2.7560400000000005,
            "hasRDI": true,
            "daily": 17.225250000000003,
            "unit": "mg"
          },
          {
            "label": "Vitamin B6",
            "tag": "VITB6A",
            "schemaOrgTag": null,
            "total": 0.33558000000000004,
            "hasRDI": true,
            "daily": 25.813846153846157,
            "unit": "mg"
          },
          {
            "label": "Folate equivalent (total)",
            "tag": "FOLDFE",
            "schemaOrgTag": null,
            "total": 171.36,
            "hasRDI": true,
            "daily": 42.84,
            "unit": "µg"
          },
          {
            "label": "Folate (food)",
            "tag": "FOLFD",
            "schemaOrgTag": null,
            "total": 171.36,
            "hasRDI": false,
            "daily": 0,
            "unit": "µg"
          },
          {
            "label": "Folic acid",
            "tag": "FOLAC",
            "schemaOrgTag": null,
            "total": 0,
            "hasRDI": false,
            "daily": 0,
            "unit": "µg"
          },
          {
            "label": "Vitamin B12",
            "tag": "VITB12",
            "schemaOrgTag": null,
            "total": 0,
            "hasRDI": true,
            "daily": 0,
            "unit": "µg"
          },
          {
            "label": "Vitamin D",
            "tag": "VITD",
            "schemaOrgTag": null,
            "total": 0,
            "hasRDI": true,
            "daily": 0,
            "unit": "µg"
          },
          {
            "label": "Vitamin E",
            "tag": "TOCPHA",
            "schemaOrgTag": null,
            "total": 2.0706,
            "hasRDI": true,
            "daily": 13.804000000000002,
            "unit": "mg"
          },
          {
            "label": "Vitamin K",
            "tag": "VITK1",
            "schemaOrgTag": null,
            "total": 15.708000000000002,
            "hasRDI": true,
            "daily": 13.090000000000002,
            "unit": "µg"
          },
          {
            "label": "Sugar alcohols",
            "tag": "Sugar.alcohol",
            "schemaOrgTag": null,
            "total": 0,
            "hasRDI": false,
            "daily": 0,
            "unit": "g"
          },
          {
            "label": "Water",
            "tag": "WATER",
            "schemaOrgTag": null,
            "total": 1118.927900640062,
            "hasRDI": false,
            "daily": 0,
            "unit": "g"
          }
        ]
      },
      "_links": {
        "self": {
          "title": "Self",
          "href": "https://api.edamam.com/api/recipes/v2/84b8126a7e5c3ceea9dcaee0f4d8df00?type=public&app_id=19c82497&app_key=f7ce5672f67e97572eed94fb0984eeda"
        }
      }
    },
    {
      "recipe": {
        "uri": "http://www.edamam.com/ontologies/edamam.owl#recipe_067f0b7be628ae847366e4f3e614b319",
        "label": "Maple Banana Frozen Yogurt",
        "image": "https://edamam-product-images.s3.amazonaws.com/web-img/b2d/b2dbd9ac524a41cae54682d3b5dc8d10.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQCJQIhC4qkNQMT%2BsfZBBM6imfSCbhc00qVjzyisP5jbTQIgXMqQdGGlAXZiff%2BGvNSrIr36AHleRUl%2BGIfUD8bwygEqwgUI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDM3sys8nakzofhDwXiqWBccYz0YciF5X1grIj6gaZZuBtpTjI9IkWAubjd7sTVJlYoexV87XA%2FB87TzPV%2FfI2zqHVQy2GpGfkVwL3Ly1qnOQ2BpRk4flwSjo0yHTDkksTs%2BXD8v2KCAUwqUxYGaM7sPQkQC32Q060ESB%2BOBIAhD1ssM%2F5b8mCPiFQw2bgGD5m6B5lFjvhrJESgb9QibQZL8I0zmfFxsz5c5f3G2mMzKoq6lEj5mdozARyAAAJ5G0Kilhlc4g%2F11N5dtj92wp1xPXsKriknz3XtezFsj%2F0v0Tq0ExabUWLJ8f1C8e%2B8c21ncWf5U1cAIfgBQ9PmOEdduFwfXIdZssJ%2FU%2FGb%2BHMP4QS0azQGD0yXjcSjunbuguH%2Bea0E3C2lFcbVgtG%2BgY7S9J5k7dCBtYgAYReml1QtxfSucUeSxSIp8giBjBj0JPr9kvpzxk6TggV%2BZCc3grqQuouJ%2FIm6AXrokvVxm7esnuj7XhmLDdPta8NlLL9o0yz1x9kWA%2Be9EvQebBY%2BhPdSOAkpdaR5M8i7LNpYwnF1QKmX2e7eIl1zxkq3DcjQqaBcpGREQV3s3u8MwXgs0z5oADHuleswS%2FMQUjZFzvoIRMr57rW7RSFCY3beAT2twX%2FpxxzwDUCMjiyGHSKoi1FSlXO6ho7jibg2P%2FOsO2u7gzUev%2B0CE5KWUPYvlCXrT%2Bd30UvGrzhpwOavbrdZ5Cnk21nv1o6CIfE0ZBeSu7ko8X07HbMZ%2ByT9kewIecODZ9I%2Ft7Df5%2B4VdvrHrqBfTBvtO4MVee16JAorw%2FmolH7iVsgprBx0W1oiwEIwTVoZje1YrDPah%2FbOrqP9BpK3XKCPhaSDh3LBbrBDruK%2F1SGg0zMjzaRsR%2Bd80ZfeIrv71uxFDFaPQoMO%2BklqIGOrEBIXOcU5WqFpqOnHohJ6zsIdyW2cDKsUOjo%2BxSSRx%2FiycpoDlLhkBwgxFH7h2BC94mIgT5fufqg1OUYConhFOxIuFZ%2FGVBCn0eZWUTigGnHCc9XAetoMd8EWZ9NEK8lcUSFVVYqxlVwi4hU6%2BAf4TWxUyrYdcATxSyOXNSDY22dBaOMICi7DPZr3AwR0FkBzhF%2F0vnmv6Pq6452uYLSBB21ZNTkEm8VLVbhqlb4748z8eb&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230423T213731Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFBHDLLY5C%2F20230423%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=d4fcf9ca4d8fdd7e8cc5fce988ba339e7ceece8922896ee1ff09186e3ab16aff",
        "images": {
          "THUMBNAIL": {
            "url": "https://edamam-product-images.s3.amazonaws.com/web-img/b2d/b2dbd9ac524a41cae54682d3b5dc8d10-s.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQCJQIhC4qkNQMT%2BsfZBBM6imfSCbhc00qVjzyisP5jbTQIgXMqQdGGlAXZiff%2BGvNSrIr36AHleRUl%2BGIfUD8bwygEqwgUI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDM3sys8nakzofhDwXiqWBccYz0YciF5X1grIj6gaZZuBtpTjI9IkWAubjd7sTVJlYoexV87XA%2FB87TzPV%2FfI2zqHVQy2GpGfkVwL3Ly1qnOQ2BpRk4flwSjo0yHTDkksTs%2BXD8v2KCAUwqUxYGaM7sPQkQC32Q060ESB%2BOBIAhD1ssM%2F5b8mCPiFQw2bgGD5m6B5lFjvhrJESgb9QibQZL8I0zmfFxsz5c5f3G2mMzKoq6lEj5mdozARyAAAJ5G0Kilhlc4g%2F11N5dtj92wp1xPXsKriknz3XtezFsj%2F0v0Tq0ExabUWLJ8f1C8e%2B8c21ncWf5U1cAIfgBQ9PmOEdduFwfXIdZssJ%2FU%2FGb%2BHMP4QS0azQGD0yXjcSjunbuguH%2Bea0E3C2lFcbVgtG%2BgY7S9J5k7dCBtYgAYReml1QtxfSucUeSxSIp8giBjBj0JPr9kvpzxk6TggV%2BZCc3grqQuouJ%2FIm6AXrokvVxm7esnuj7XhmLDdPta8NlLL9o0yz1x9kWA%2Be9EvQebBY%2BhPdSOAkpdaR5M8i7LNpYwnF1QKmX2e7eIl1zxkq3DcjQqaBcpGREQV3s3u8MwXgs0z5oADHuleswS%2FMQUjZFzvoIRMr57rW7RSFCY3beAT2twX%2FpxxzwDUCMjiyGHSKoi1FSlXO6ho7jibg2P%2FOsO2u7gzUev%2B0CE5KWUPYvlCXrT%2Bd30UvGrzhpwOavbrdZ5Cnk21nv1o6CIfE0ZBeSu7ko8X07HbMZ%2ByT9kewIecODZ9I%2Ft7Df5%2B4VdvrHrqBfTBvtO4MVee16JAorw%2FmolH7iVsgprBx0W1oiwEIwTVoZje1YrDPah%2FbOrqP9BpK3XKCPhaSDh3LBbrBDruK%2F1SGg0zMjzaRsR%2Bd80ZfeIrv71uxFDFaPQoMO%2BklqIGOrEBIXOcU5WqFpqOnHohJ6zsIdyW2cDKsUOjo%2BxSSRx%2FiycpoDlLhkBwgxFH7h2BC94mIgT5fufqg1OUYConhFOxIuFZ%2FGVBCn0eZWUTigGnHCc9XAetoMd8EWZ9NEK8lcUSFVVYqxlVwi4hU6%2BAf4TWxUyrYdcATxSyOXNSDY22dBaOMICi7DPZr3AwR0FkBzhF%2F0vnmv6Pq6452uYLSBB21ZNTkEm8VLVbhqlb4748z8eb&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230423T213731Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFBHDLLY5C%2F20230423%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=282fada8a8f7fe11292f5e74ce53f3fb2a371ba3bc21c95567bd6b7dc3bf5f4b",
            "width": 100,
            "height": 100
          },
          "SMALL": {
            "url": "https://edamam-product-images.s3.amazonaws.com/web-img/b2d/b2dbd9ac524a41cae54682d3b5dc8d10-m.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQCJQIhC4qkNQMT%2BsfZBBM6imfSCbhc00qVjzyisP5jbTQIgXMqQdGGlAXZiff%2BGvNSrIr36AHleRUl%2BGIfUD8bwygEqwgUI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDM3sys8nakzofhDwXiqWBccYz0YciF5X1grIj6gaZZuBtpTjI9IkWAubjd7sTVJlYoexV87XA%2FB87TzPV%2FfI2zqHVQy2GpGfkVwL3Ly1qnOQ2BpRk4flwSjo0yHTDkksTs%2BXD8v2KCAUwqUxYGaM7sPQkQC32Q060ESB%2BOBIAhD1ssM%2F5b8mCPiFQw2bgGD5m6B5lFjvhrJESgb9QibQZL8I0zmfFxsz5c5f3G2mMzKoq6lEj5mdozARyAAAJ5G0Kilhlc4g%2F11N5dtj92wp1xPXsKriknz3XtezFsj%2F0v0Tq0ExabUWLJ8f1C8e%2B8c21ncWf5U1cAIfgBQ9PmOEdduFwfXIdZssJ%2FU%2FGb%2BHMP4QS0azQGD0yXjcSjunbuguH%2Bea0E3C2lFcbVgtG%2BgY7S9J5k7dCBtYgAYReml1QtxfSucUeSxSIp8giBjBj0JPr9kvpzxk6TggV%2BZCc3grqQuouJ%2FIm6AXrokvVxm7esnuj7XhmLDdPta8NlLL9o0yz1x9kWA%2Be9EvQebBY%2BhPdSOAkpdaR5M8i7LNpYwnF1QKmX2e7eIl1zxkq3DcjQqaBcpGREQV3s3u8MwXgs0z5oADHuleswS%2FMQUjZFzvoIRMr57rW7RSFCY3beAT2twX%2FpxxzwDUCMjiyGHSKoi1FSlXO6ho7jibg2P%2FOsO2u7gzUev%2B0CE5KWUPYvlCXrT%2Bd30UvGrzhpwOavbrdZ5Cnk21nv1o6CIfE0ZBeSu7ko8X07HbMZ%2ByT9kewIecODZ9I%2Ft7Df5%2B4VdvrHrqBfTBvtO4MVee16JAorw%2FmolH7iVsgprBx0W1oiwEIwTVoZje1YrDPah%2FbOrqP9BpK3XKCPhaSDh3LBbrBDruK%2F1SGg0zMjzaRsR%2Bd80ZfeIrv71uxFDFaPQoMO%2BklqIGOrEBIXOcU5WqFpqOnHohJ6zsIdyW2cDKsUOjo%2BxSSRx%2FiycpoDlLhkBwgxFH7h2BC94mIgT5fufqg1OUYConhFOxIuFZ%2FGVBCn0eZWUTigGnHCc9XAetoMd8EWZ9NEK8lcUSFVVYqxlVwi4hU6%2BAf4TWxUyrYdcATxSyOXNSDY22dBaOMICi7DPZr3AwR0FkBzhF%2F0vnmv6Pq6452uYLSBB21ZNTkEm8VLVbhqlb4748z8eb&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230423T213731Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFBHDLLY5C%2F20230423%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=c20b0775c768699c972230c688206ad866f7d9508173b8039ecb315e0d7742ea",
            "width": 200,
            "height": 200
          },
          "REGULAR": {
            "url": "https://edamam-product-images.s3.amazonaws.com/web-img/b2d/b2dbd9ac524a41cae54682d3b5dc8d10.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQCJQIhC4qkNQMT%2BsfZBBM6imfSCbhc00qVjzyisP5jbTQIgXMqQdGGlAXZiff%2BGvNSrIr36AHleRUl%2BGIfUD8bwygEqwgUI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDM3sys8nakzofhDwXiqWBccYz0YciF5X1grIj6gaZZuBtpTjI9IkWAubjd7sTVJlYoexV87XA%2FB87TzPV%2FfI2zqHVQy2GpGfkVwL3Ly1qnOQ2BpRk4flwSjo0yHTDkksTs%2BXD8v2KCAUwqUxYGaM7sPQkQC32Q060ESB%2BOBIAhD1ssM%2F5b8mCPiFQw2bgGD5m6B5lFjvhrJESgb9QibQZL8I0zmfFxsz5c5f3G2mMzKoq6lEj5mdozARyAAAJ5G0Kilhlc4g%2F11N5dtj92wp1xPXsKriknz3XtezFsj%2F0v0Tq0ExabUWLJ8f1C8e%2B8c21ncWf5U1cAIfgBQ9PmOEdduFwfXIdZssJ%2FU%2FGb%2BHMP4QS0azQGD0yXjcSjunbuguH%2Bea0E3C2lFcbVgtG%2BgY7S9J5k7dCBtYgAYReml1QtxfSucUeSxSIp8giBjBj0JPr9kvpzxk6TggV%2BZCc3grqQuouJ%2FIm6AXrokvVxm7esnuj7XhmLDdPta8NlLL9o0yz1x9kWA%2Be9EvQebBY%2BhPdSOAkpdaR5M8i7LNpYwnF1QKmX2e7eIl1zxkq3DcjQqaBcpGREQV3s3u8MwXgs0z5oADHuleswS%2FMQUjZFzvoIRMr57rW7RSFCY3beAT2twX%2FpxxzwDUCMjiyGHSKoi1FSlXO6ho7jibg2P%2FOsO2u7gzUev%2B0CE5KWUPYvlCXrT%2Bd30UvGrzhpwOavbrdZ5Cnk21nv1o6CIfE0ZBeSu7ko8X07HbMZ%2ByT9kewIecODZ9I%2Ft7Df5%2B4VdvrHrqBfTBvtO4MVee16JAorw%2FmolH7iVsgprBx0W1oiwEIwTVoZje1YrDPah%2FbOrqP9BpK3XKCPhaSDh3LBbrBDruK%2F1SGg0zMjzaRsR%2Bd80ZfeIrv71uxFDFaPQoMO%2BklqIGOrEBIXOcU5WqFpqOnHohJ6zsIdyW2cDKsUOjo%2BxSSRx%2FiycpoDlLhkBwgxFH7h2BC94mIgT5fufqg1OUYConhFOxIuFZ%2FGVBCn0eZWUTigGnHCc9XAetoMd8EWZ9NEK8lcUSFVVYqxlVwi4hU6%2BAf4TWxUyrYdcATxSyOXNSDY22dBaOMICi7DPZr3AwR0FkBzhF%2F0vnmv6Pq6452uYLSBB21ZNTkEm8VLVbhqlb4748z8eb&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230423T213731Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFBHDLLY5C%2F20230423%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=d4fcf9ca4d8fdd7e8cc5fce988ba339e7ceece8922896ee1ff09186e3ab16aff",
            "width": 300,
            "height": 300
          },
          "LARGE": {
            "url": "https://edamam-product-images.s3.amazonaws.com/web-img/b2d/b2dbd9ac524a41cae54682d3b5dc8d10-l.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQCJQIhC4qkNQMT%2BsfZBBM6imfSCbhc00qVjzyisP5jbTQIgXMqQdGGlAXZiff%2BGvNSrIr36AHleRUl%2BGIfUD8bwygEqwgUI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDM3sys8nakzofhDwXiqWBccYz0YciF5X1grIj6gaZZuBtpTjI9IkWAubjd7sTVJlYoexV87XA%2FB87TzPV%2FfI2zqHVQy2GpGfkVwL3Ly1qnOQ2BpRk4flwSjo0yHTDkksTs%2BXD8v2KCAUwqUxYGaM7sPQkQC32Q060ESB%2BOBIAhD1ssM%2F5b8mCPiFQw2bgGD5m6B5lFjvhrJESgb9QibQZL8I0zmfFxsz5c5f3G2mMzKoq6lEj5mdozARyAAAJ5G0Kilhlc4g%2F11N5dtj92wp1xPXsKriknz3XtezFsj%2F0v0Tq0ExabUWLJ8f1C8e%2B8c21ncWf5U1cAIfgBQ9PmOEdduFwfXIdZssJ%2FU%2FGb%2BHMP4QS0azQGD0yXjcSjunbuguH%2Bea0E3C2lFcbVgtG%2BgY7S9J5k7dCBtYgAYReml1QtxfSucUeSxSIp8giBjBj0JPr9kvpzxk6TggV%2BZCc3grqQuouJ%2FIm6AXrokvVxm7esnuj7XhmLDdPta8NlLL9o0yz1x9kWA%2Be9EvQebBY%2BhPdSOAkpdaR5M8i7LNpYwnF1QKmX2e7eIl1zxkq3DcjQqaBcpGREQV3s3u8MwXgs0z5oADHuleswS%2FMQUjZFzvoIRMr57rW7RSFCY3beAT2twX%2FpxxzwDUCMjiyGHSKoi1FSlXO6ho7jibg2P%2FOsO2u7gzUev%2B0CE5KWUPYvlCXrT%2Bd30UvGrzhpwOavbrdZ5Cnk21nv1o6CIfE0ZBeSu7ko8X07HbMZ%2ByT9kewIecODZ9I%2Ft7Df5%2B4VdvrHrqBfTBvtO4MVee16JAorw%2FmolH7iVsgprBx0W1oiwEIwTVoZje1YrDPah%2FbOrqP9BpK3XKCPhaSDh3LBbrBDruK%2F1SGg0zMjzaRsR%2Bd80ZfeIrv71uxFDFaPQoMO%2BklqIGOrEBIXOcU5WqFpqOnHohJ6zsIdyW2cDKsUOjo%2BxSSRx%2FiycpoDlLhkBwgxFH7h2BC94mIgT5fufqg1OUYConhFOxIuFZ%2FGVBCn0eZWUTigGnHCc9XAetoMd8EWZ9NEK8lcUSFVVYqxlVwi4hU6%2BAf4TWxUyrYdcATxSyOXNSDY22dBaOMICi7DPZr3AwR0FkBzhF%2F0vnmv6Pq6452uYLSBB21ZNTkEm8VLVbhqlb4748z8eb&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230423T213731Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFBHDLLY5C%2F20230423%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=6557b5ff6fb9218a74cabf52aac85dc227f2198d4565d15a7ea05cd3e2adb021",
            "width": 600,
            "height": 600
          }
        },
        "source": "No Recipes",
        "url": "http://norecipes.com/blog/2008/04/26/maple-banana-frozen-yogurt/",
        "shareAs": "http://www.edamam.com/recipe/maple-banana-frozen-yogurt-067f0b7be628ae847366e4f3e614b319/-",
        "yield": 4,
        "dietLabels": [
          "Balanced",
          "Low-Sodium"
        ],
        "healthLabels": [
          "Vegetarian",
          "Pescatarian",
          "Mediterranean",
          "Gluten-Free",
          "Wheat-Free",
          "Egg-Free",
          "Peanut-Free",
          "Tree-Nut-Free",
          "Soy-Free",
          "Fish-Free",
          "Shellfish-Free",
          "Pork-Free",
          "Red-Meat-Free",
          "Crustacean-Free",
          "Celery-Free",
          "Mustard-Free",
          "Sesame-Free",
          "Lupine-Free",
          "Mollusk-Free",
          "Alcohol-Free",
          "No oil added",
          "Sulfite-Free",
          "Kosher"
        ],
        "cautions": [
          "Sulfites"
        ],
        "ingredientLines": [
          "2 rice bananas",
          "16 oz maple yogurt (I use Brown Cow Cream Top)",
          "1 tsp vanilla"
        ],
        "ingredients": [
          {
            "text": "2 rice bananas",
            "quantity": 2,
            "measure": "<unit>",
            "food": "bananas",
            "weight": 231.4,
            "foodCategory": "fruit",
            "foodId": "food_bjsfxtcaidvmhaa3afrbna43q3hu",
            "image": "https://www.edamam.com/food-img/9f6/9f6181163a25c96022ee3fc66d9ebb11.jpg"
          },
          {
            "text": "16 oz maple yogurt (I use Brown Cow Cream Top)",
            "quantity": 16,
            "measure": "ounce",
            "food": "yogurt",
            "weight": 453.59237,
            "foodCategory": "yogurt",
            "foodId": "food_a79ojfkbgdeekgblqmky9bunr8f6",
            "image": "https://www.edamam.com/food-img/933/933eb3791b3a2175e007f1607d56b7e2.jpg"
          },
          {
            "text": "1 tsp vanilla",
            "quantity": 1,
            "measure": "teaspoon",
            "food": "vanilla",
            "weight": 4.2,
            "foodCategory": "Condiments and sauces",
            "foodId": "food_bh1wvnqaw3q7ciascfoygaabax2a",
            "image": "https://www.edamam.com/food-img/90f/90f910b0bf82750d4f6528263e014cca.jpg"
          }
        ],
        "calories": 494.7333457000001,
        "totalWeight": 689.1923700000001,
        "totalTime": 0,
        "cuisineType": [
          "american"
        ],
        "mealType": [
          "lunch/dinner"
        ],
        "dishType": [
          "desserts"
        ],
        "totalNutrients": {
          "ENERC_KCAL": {
            "label": "Energy",
            "quantity": 494.7333457000001,
            "unit": "kcal"
          },
          "FAT": {
            "label": "Fat",
            "quantity": 15.507892025000002,
            "unit": "g"
          },
          "FASAT": {
            "label": "Saturated",
            "quantity": 9.766884075200002,
            "unit": "g"
          },
          "FATRN": {
            "label": "Trans",
            "quantity": 0,
            "unit": "g"
          },
          "FAMS": {
            "label": "Monounsaturated",
            "quantity": 4.125047864100001,
            "unit": "g"
          },
          "FAPU": {
            "label": "Polyunsaturated",
            "quantity": 0.5863949803999999,
            "unit": "g"
          },
          "CHOCDF": {
            "label": "Carbs",
            "quantity": 74.520464442,
            "unit": "g"
          },
          "CHOCDF.net": {
            "label": "Carbohydrates (net)",
            "quantity": 68.504064442,
            "unit": "g"
          },
          "FIBTG": {
            "label": "Fiber",
            "quantity": 6.0164,
            "unit": "g"
          },
          "SUGAR": {
            "label": "Sugars",
            "quantity": 49.96892444200001,
            "unit": "g"
          },
          "SUGAR.added": {
            "label": "Sugars, added",
            "quantity": 0,
            "unit": "g"
          },
          "PROCNT": {
            "label": "Protein",
            "quantity": 18.264435239000004,
            "unit": "g"
          },
          "CHOLE": {
            "label": "Cholesterol",
            "quantity": 58.96700810000001,
            "unit": "mg"
          },
          "NA": {
            "label": "Sodium",
            "quantity": 211.3444902,
            "unit": "mg"
          },
          "CA": {
            "label": "Calcium",
            "quantity": 560.8787677000001,
            "unit": "mg"
          },
          "MG": {
            "label": "Magnesium",
            "quantity": 117.41308440000002,
            "unit": "mg"
          },
          "K": {
            "label": "Potassium",
            "quantity": 1537.6961735,
            "unit": "mg"
          },
          "FE": {
            "label": "Iron",
            "quantity": 0.8334761850000002,
            "unit": "mg"
          },
          "ZN": {
            "label": "Zinc",
            "quantity": 3.0279149830000005,
            "unit": "mg"
          },
          "P": {
            "label": "Phosphorus",
            "quantity": 482.0727515000001,
            "unit": "mg"
          },
          "VITA_RAE": {
            "label": "Vitamin A",
            "quantity": 129.41193990000002,
            "unit": "µg"
          },
          "VITC": {
            "label": "Vitamin C",
            "quantity": 22.399761849999997,
            "unit": "mg"
          },
          "THIA": {
            "label": "Thiamin (B1)",
            "quantity": 0.2037377873,
            "unit": "mg"
          },
          "RIBF": {
            "label": "Riboflavin (B2)",
            "quantity": 0.8170131654000001,
            "unit": "mg"
          },
          "NIA": {
            "label": "Niacin (B3)",
            "quantity": 1.8968542775,
            "unit": "mg"
          },
          "VITB6A": {
            "label": "Vitamin B6",
            "quantity": 0.9954795584,
            "unit": "mg"
          },
          "FOLDFE": {
            "label": "Folate equivalent (total)",
            "quantity": 78.0314659,
            "unit": "µg"
          },
          "FOLFD": {
            "label": "Folate (food)",
            "quantity": 78.0314659,
            "unit": "µg"
          },
          "FOLAC": {
            "label": "Folic acid",
            "quantity": 0,
            "unit": "µg"
          },
          "VITB12": {
            "label": "Vitamin B12",
            "quantity": 1.678291769,
            "unit": "µg"
          },
          "VITD": {
            "label": "Vitamin D",
            "quantity": 0.4535923700000001,
            "unit": "µg"
          },
          "TOCPHA": {
            "label": "Vitamin E",
            "quantity": 0.503555422,
            "unit": "mg"
          },
          "VITK1": {
            "label": "Vitamin K",
            "quantity": 2.06418474,
            "unit": "µg"
          },
          "Sugar.alcohol": {
            "label": "Sugar alcohol",
            "quantity": 0,
            "unit": "g"
          },
          "WATER": {
            "label": "Water",
            "quantity": 574.2577932300001,
            "unit": "g"
          }
        },
        "totalDaily": {
          "ENERC_KCAL": {
            "label": "Energy",
            "quantity": 24.736667285000003,
            "unit": "%"
          },
          "FAT": {
            "label": "Fat",
            "quantity": 23.858295423076925,
            "unit": "%"
          },
          "FASAT": {
            "label": "Saturated",
            "quantity": 48.83442037600001,
            "unit": "%"
          },
          "CHOCDF": {
            "label": "Carbs",
            "quantity": 24.840154814,
            "unit": "%"
          },
          "FIBTG": {
            "label": "Fiber",
            "quantity": 24.0656,
            "unit": "%"
          },
          "PROCNT": {
            "label": "Protein",
            "quantity": 36.52887047800001,
            "unit": "%"
          },
          "CHOLE": {
            "label": "Cholesterol",
            "quantity": 19.65566936666667,
            "unit": "%"
          },
          "NA": {
            "label": "Sodium",
            "quantity": 8.806020425,
            "unit": "%"
          },
          "CA": {
            "label": "Calcium",
            "quantity": 56.087876770000015,
            "unit": "%"
          },
          "MG": {
            "label": "Magnesium",
            "quantity": 27.955496285714293,
            "unit": "%"
          },
          "K": {
            "label": "Potassium",
            "quantity": 32.71693986170212,
            "unit": "%"
          },
          "FE": {
            "label": "Iron",
            "quantity": 4.6304232500000015,
            "unit": "%"
          },
          "ZN": {
            "label": "Zinc",
            "quantity": 27.526499845454552,
            "unit": "%"
          },
          "P": {
            "label": "Phosphorus",
            "quantity": 68.86753592857144,
            "unit": "%"
          },
          "VITA_RAE": {
            "label": "Vitamin A",
            "quantity": 14.379104433333335,
            "unit": "%"
          },
          "VITC": {
            "label": "Vitamin C",
            "quantity": 24.888624277777772,
            "unit": "%"
          },
          "THIA": {
            "label": "Thiamin (B1)",
            "quantity": 16.978148941666667,
            "unit": "%"
          },
          "RIBF": {
            "label": "Riboflavin (B2)",
            "quantity": 62.84716656923077,
            "unit": "%"
          },
          "NIA": {
            "label": "Niacin (B3)",
            "quantity": 11.855339234375,
            "unit": "%"
          },
          "VITB6A": {
            "label": "Vitamin B6",
            "quantity": 76.57535064615385,
            "unit": "%"
          },
          "FOLDFE": {
            "label": "Folate equivalent (total)",
            "quantity": 19.507866475,
            "unit": "%"
          },
          "VITB12": {
            "label": "Vitamin B12",
            "quantity": 69.92882370833334,
            "unit": "%"
          },
          "VITD": {
            "label": "Vitamin D",
            "quantity": 3.0239491333333337,
            "unit": "%"
          },
          "TOCPHA": {
            "label": "Vitamin E",
            "quantity": 3.3570361466666667,
            "unit": "%"
          },
          "VITK1": {
            "label": "Vitamin K",
            "quantity": 1.72015395,
            "unit": "%"
          }
        },
        "digest": [
          {
            "label": "Fat",
            "tag": "FAT",
            "schemaOrgTag": "fatContent",
            "total": 15.507892025000002,
            "hasRDI": true,
            "daily": 23.858295423076925,
            "unit": "g",
            "sub": [
              {
                "label": "Saturated",
                "tag": "FASAT",
                "schemaOrgTag": "saturatedFatContent",
                "total": 9.766884075200002,
                "hasRDI": true,
                "daily": 48.83442037600001,
                "unit": "g"
              },
              {
                "label": "Trans",
                "tag": "FATRN",
                "schemaOrgTag": "transFatContent",
                "total": 0,
                "hasRDI": false,
                "daily": 0,
                "unit": "g"
              },
              {
                "label": "Monounsaturated",
                "tag": "FAMS",
                "schemaOrgTag": null,
                "total": 4.125047864100001,
                "hasRDI": false,
                "daily": 0,
                "unit": "g"
              },
              {
                "label": "Polyunsaturated",
                "tag": "FAPU",
                "schemaOrgTag": null,
                "total": 0.5863949803999999,
                "hasRDI": false,
                "daily": 0,
                "unit": "g"
              }
            ]
          },
          {
            "label": "Carbs",
            "tag": "CHOCDF",
            "schemaOrgTag": "carbohydrateContent",
            "total": 74.520464442,
            "hasRDI": true,
            "daily": 24.840154814,
            "unit": "g",
            "sub": [
              {
                "label": "Carbs (net)",
                "tag": "CHOCDF.net",
                "schemaOrgTag": null,
                "total": 68.504064442,
                "hasRDI": false,
                "daily": 0,
                "unit": "g"
              },
              {
                "label": "Fiber",
                "tag": "FIBTG",
                "schemaOrgTag": "fiberContent",
                "total": 6.0164,
                "hasRDI": true,
                "daily": 24.0656,
                "unit": "g"
              },
              {
                "label": "Sugars",
                "tag": "SUGAR",
                "schemaOrgTag": "sugarContent",
                "total": 49.96892444200001,
                "hasRDI": false,
                "daily": 0,
                "unit": "g"
              },
              {
                "label": "Sugars, added",
                "tag": "SUGAR.added",
                "schemaOrgTag": null,
                "total": 0,
                "hasRDI": false,
                "daily": 0,
                "unit": "g"
              }
            ]
          },
          {
            "label": "Protein",
            "tag": "PROCNT",
            "schemaOrgTag": "proteinContent",
            "total": 18.264435239000004,
            "hasRDI": true,
            "daily": 36.52887047800001,
            "unit": "g"
          },
          {
            "label": "Cholesterol",
            "tag": "CHOLE",
            "schemaOrgTag": "cholesterolContent",
            "total": 58.96700810000001,
            "hasRDI": true,
            "daily": 19.65566936666667,
            "unit": "mg"
          },
          {
            "label": "Sodium",
            "tag": "NA",
            "schemaOrgTag": "sodiumContent",
            "total": 211.3444902,
            "hasRDI": true,
            "daily": 8.806020425,
            "unit": "mg"
          },
          {
            "label": "Calcium",
            "tag": "CA",
            "schemaOrgTag": null,
            "total": 560.8787677000001,
            "hasRDI": true,
            "daily": 56.087876770000015,
            "unit": "mg"
          },
          {
            "label": "Magnesium",
            "tag": "MG",
            "schemaOrgTag": null,
            "total": 117.41308440000002,
            "hasRDI": true,
            "daily": 27.955496285714293,
            "unit": "mg"
          },
          {
            "label": "Potassium",
            "tag": "K",
            "schemaOrgTag": null,
            "total": 1537.6961735,
            "hasRDI": true,
            "daily": 32.71693986170212,
            "unit": "mg"
          },
          {
            "label": "Iron",
            "tag": "FE",
            "schemaOrgTag": null,
            "total": 0.8334761850000002,
            "hasRDI": true,
            "daily": 4.6304232500000015,
            "unit": "mg"
          },
          {
            "label": "Zinc",
            "tag": "ZN",
            "schemaOrgTag": null,
            "total": 3.0279149830000005,
            "hasRDI": true,
            "daily": 27.526499845454552,
            "unit": "mg"
          },
          {
            "label": "Phosphorus",
            "tag": "P",
            "schemaOrgTag": null,
            "total": 482.0727515000001,
            "hasRDI": true,
            "daily": 68.86753592857144,
            "unit": "mg"
          },
          {
            "label": "Vitamin A",
            "tag": "VITA_RAE",
            "schemaOrgTag": null,
            "total": 129.41193990000002,
            "hasRDI": true,
            "daily": 14.379104433333335,
            "unit": "µg"
          },
          {
            "label": "Vitamin C",
            "tag": "VITC",
            "schemaOrgTag": null,
            "total": 22.399761849999997,
            "hasRDI": true,
            "daily": 24.888624277777772,
            "unit": "mg"
          },
          {
            "label": "Thiamin (B1)",
            "tag": "THIA",
            "schemaOrgTag": null,
            "total": 0.2037377873,
            "hasRDI": true,
            "daily": 16.978148941666667,
            "unit": "mg"
          },
          {
            "label": "Riboflavin (B2)",
            "tag": "RIBF",
            "schemaOrgTag": null,
            "total": 0.8170131654000001,
            "hasRDI": true,
            "daily": 62.84716656923077,
            "unit": "mg"
          },
          {
            "label": "Niacin (B3)",
            "tag": "NIA",
            "schemaOrgTag": null,
            "total": 1.8968542775,
            "hasRDI": true,
            "daily": 11.855339234375,
            "unit": "mg"
          },
          {
            "label": "Vitamin B6",
            "tag": "VITB6A",
            "schemaOrgTag": null,
            "total": 0.9954795584,
            "hasRDI": true,
            "daily": 76.57535064615385,
            "unit": "mg"
          },
          {
            "label": "Folate equivalent (total)",
            "tag": "FOLDFE",
            "schemaOrgTag": null,
            "total": 78.0314659,
            "hasRDI": true,
            "daily": 19.507866475,
            "unit": "µg"
          },
          {
            "label": "Folate (food)",
            "tag": "FOLFD",
            "schemaOrgTag": null,
            "total": 78.0314659,
            "hasRDI": false,
            "daily": 0,
            "unit": "µg"
          },
          {
            "label": "Folic acid",
            "tag": "FOLAC",
            "schemaOrgTag": null,
            "total": 0,
            "hasRDI": false,
            "daily": 0,
            "unit": "µg"
          },
          {
            "label": "Vitamin B12",
            "tag": "VITB12",
            "schemaOrgTag": null,
            "total": 1.678291769,
            "hasRDI": true,
            "daily": 69.92882370833334,
            "unit": "µg"
          },
          {
            "label": "Vitamin D",
            "tag": "VITD",
            "schemaOrgTag": null,
            "total": 0.4535923700000001,
            "hasRDI": true,
            "daily": 3.0239491333333337,
            "unit": "µg"
          },
          {
            "label": "Vitamin E",
            "tag": "TOCPHA",
            "schemaOrgTag": null,
            "total": 0.503555422,
            "hasRDI": true,
            "daily": 3.3570361466666667,
            "unit": "mg"
          },
          {
            "label": "Vitamin K",
            "tag": "VITK1",
            "schemaOrgTag": null,
            "total": 2.06418474,
            "hasRDI": true,
            "daily": 1.72015395,
            "unit": "µg"
          },
          {
            "label": "Sugar alcohols",
            "tag": "Sugar.alcohol",
            "schemaOrgTag": null,
            "total": 0,
            "hasRDI": false,
            "daily": 0,
            "unit": "g"
          },
          {
            "label": "Water",
            "tag": "WATER",
            "schemaOrgTag": null,
            "total": 574.2577932300001,
            "hasRDI": false,
            "daily": 0,
            "unit": "g"
          }
        ]
      },
      "_links": {
        "self": {
          "title": "Self",
          "href": "https://api.edamam.com/api/recipes/v2/067f0b7be628ae847366e4f3e614b319?type=public&app_id=19c82497&app_key=f7ce5672f67e97572eed94fb0984eeda"
        }
      }
    },
    {
      "recipe": {
        "uri": "http://www.edamam.com/ontologies/edamam.owl#recipe_845a9adf81bb22f3b76ead2981a872a0",
        "label": "Vanilla Ice Cream With Grilled Corn And Lime",
        "image": "https://edamam-product-images.s3.amazonaws.com/web-img/270/270c9aae056587c1f176ae6eafdb4c0d.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQCJQIhC4qkNQMT%2BsfZBBM6imfSCbhc00qVjzyisP5jbTQIgXMqQdGGlAXZiff%2BGvNSrIr36AHleRUl%2BGIfUD8bwygEqwgUI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDM3sys8nakzofhDwXiqWBccYz0YciF5X1grIj6gaZZuBtpTjI9IkWAubjd7sTVJlYoexV87XA%2FB87TzPV%2FfI2zqHVQy2GpGfkVwL3Ly1qnOQ2BpRk4flwSjo0yHTDkksTs%2BXD8v2KCAUwqUxYGaM7sPQkQC32Q060ESB%2BOBIAhD1ssM%2F5b8mCPiFQw2bgGD5m6B5lFjvhrJESgb9QibQZL8I0zmfFxsz5c5f3G2mMzKoq6lEj5mdozARyAAAJ5G0Kilhlc4g%2F11N5dtj92wp1xPXsKriknz3XtezFsj%2F0v0Tq0ExabUWLJ8f1C8e%2B8c21ncWf5U1cAIfgBQ9PmOEdduFwfXIdZssJ%2FU%2FGb%2BHMP4QS0azQGD0yXjcSjunbuguH%2Bea0E3C2lFcbVgtG%2BgY7S9J5k7dCBtYgAYReml1QtxfSucUeSxSIp8giBjBj0JPr9kvpzxk6TggV%2BZCc3grqQuouJ%2FIm6AXrokvVxm7esnuj7XhmLDdPta8NlLL9o0yz1x9kWA%2Be9EvQebBY%2BhPdSOAkpdaR5M8i7LNpYwnF1QKmX2e7eIl1zxkq3DcjQqaBcpGREQV3s3u8MwXgs0z5oADHuleswS%2FMQUjZFzvoIRMr57rW7RSFCY3beAT2twX%2FpxxzwDUCMjiyGHSKoi1FSlXO6ho7jibg2P%2FOsO2u7gzUev%2B0CE5KWUPYvlCXrT%2Bd30UvGrzhpwOavbrdZ5Cnk21nv1o6CIfE0ZBeSu7ko8X07HbMZ%2ByT9kewIecODZ9I%2Ft7Df5%2B4VdvrHrqBfTBvtO4MVee16JAorw%2FmolH7iVsgprBx0W1oiwEIwTVoZje1YrDPah%2FbOrqP9BpK3XKCPhaSDh3LBbrBDruK%2F1SGg0zMjzaRsR%2Bd80ZfeIrv71uxFDFaPQoMO%2BklqIGOrEBIXOcU5WqFpqOnHohJ6zsIdyW2cDKsUOjo%2BxSSRx%2FiycpoDlLhkBwgxFH7h2BC94mIgT5fufqg1OUYConhFOxIuFZ%2FGVBCn0eZWUTigGnHCc9XAetoMd8EWZ9NEK8lcUSFVVYqxlVwi4hU6%2BAf4TWxUyrYdcATxSyOXNSDY22dBaOMICi7DPZr3AwR0FkBzhF%2F0vnmv6Pq6452uYLSBB21ZNTkEm8VLVbhqlb4748z8eb&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230423T213731Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFBHDLLY5C%2F20230423%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=fbef19acc8354ed816771b2e3782f822b4a260b675000953aeda26ccb30c8499",
        "images": {
          "THUMBNAIL": {
            "url": "https://edamam-product-images.s3.amazonaws.com/web-img/270/270c9aae056587c1f176ae6eafdb4c0d-s.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQCJQIhC4qkNQMT%2BsfZBBM6imfSCbhc00qVjzyisP5jbTQIgXMqQdGGlAXZiff%2BGvNSrIr36AHleRUl%2BGIfUD8bwygEqwgUI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDM3sys8nakzofhDwXiqWBccYz0YciF5X1grIj6gaZZuBtpTjI9IkWAubjd7sTVJlYoexV87XA%2FB87TzPV%2FfI2zqHVQy2GpGfkVwL3Ly1qnOQ2BpRk4flwSjo0yHTDkksTs%2BXD8v2KCAUwqUxYGaM7sPQkQC32Q060ESB%2BOBIAhD1ssM%2F5b8mCPiFQw2bgGD5m6B5lFjvhrJESgb9QibQZL8I0zmfFxsz5c5f3G2mMzKoq6lEj5mdozARyAAAJ5G0Kilhlc4g%2F11N5dtj92wp1xPXsKriknz3XtezFsj%2F0v0Tq0ExabUWLJ8f1C8e%2B8c21ncWf5U1cAIfgBQ9PmOEdduFwfXIdZssJ%2FU%2FGb%2BHMP4QS0azQGD0yXjcSjunbuguH%2Bea0E3C2lFcbVgtG%2BgY7S9J5k7dCBtYgAYReml1QtxfSucUeSxSIp8giBjBj0JPr9kvpzxk6TggV%2BZCc3grqQuouJ%2FIm6AXrokvVxm7esnuj7XhmLDdPta8NlLL9o0yz1x9kWA%2Be9EvQebBY%2BhPdSOAkpdaR5M8i7LNpYwnF1QKmX2e7eIl1zxkq3DcjQqaBcpGREQV3s3u8MwXgs0z5oADHuleswS%2FMQUjZFzvoIRMr57rW7RSFCY3beAT2twX%2FpxxzwDUCMjiyGHSKoi1FSlXO6ho7jibg2P%2FOsO2u7gzUev%2B0CE5KWUPYvlCXrT%2Bd30UvGrzhpwOavbrdZ5Cnk21nv1o6CIfE0ZBeSu7ko8X07HbMZ%2ByT9kewIecODZ9I%2Ft7Df5%2B4VdvrHrqBfTBvtO4MVee16JAorw%2FmolH7iVsgprBx0W1oiwEIwTVoZje1YrDPah%2FbOrqP9BpK3XKCPhaSDh3LBbrBDruK%2F1SGg0zMjzaRsR%2Bd80ZfeIrv71uxFDFaPQoMO%2BklqIGOrEBIXOcU5WqFpqOnHohJ6zsIdyW2cDKsUOjo%2BxSSRx%2FiycpoDlLhkBwgxFH7h2BC94mIgT5fufqg1OUYConhFOxIuFZ%2FGVBCn0eZWUTigGnHCc9XAetoMd8EWZ9NEK8lcUSFVVYqxlVwi4hU6%2BAf4TWxUyrYdcATxSyOXNSDY22dBaOMICi7DPZr3AwR0FkBzhF%2F0vnmv6Pq6452uYLSBB21ZNTkEm8VLVbhqlb4748z8eb&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230423T213731Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFBHDLLY5C%2F20230423%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=351a8bac49e0fe9c8d2fe4f9fbee253df3dff18c1070c98b8758e23f5a5e061a",
            "width": 100,
            "height": 100
          },
          "SMALL": {
            "url": "https://edamam-product-images.s3.amazonaws.com/web-img/270/270c9aae056587c1f176ae6eafdb4c0d-m.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQCJQIhC4qkNQMT%2BsfZBBM6imfSCbhc00qVjzyisP5jbTQIgXMqQdGGlAXZiff%2BGvNSrIr36AHleRUl%2BGIfUD8bwygEqwgUI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDM3sys8nakzofhDwXiqWBccYz0YciF5X1grIj6gaZZuBtpTjI9IkWAubjd7sTVJlYoexV87XA%2FB87TzPV%2FfI2zqHVQy2GpGfkVwL3Ly1qnOQ2BpRk4flwSjo0yHTDkksTs%2BXD8v2KCAUwqUxYGaM7sPQkQC32Q060ESB%2BOBIAhD1ssM%2F5b8mCPiFQw2bgGD5m6B5lFjvhrJESgb9QibQZL8I0zmfFxsz5c5f3G2mMzKoq6lEj5mdozARyAAAJ5G0Kilhlc4g%2F11N5dtj92wp1xPXsKriknz3XtezFsj%2F0v0Tq0ExabUWLJ8f1C8e%2B8c21ncWf5U1cAIfgBQ9PmOEdduFwfXIdZssJ%2FU%2FGb%2BHMP4QS0azQGD0yXjcSjunbuguH%2Bea0E3C2lFcbVgtG%2BgY7S9J5k7dCBtYgAYReml1QtxfSucUeSxSIp8giBjBj0JPr9kvpzxk6TggV%2BZCc3grqQuouJ%2FIm6AXrokvVxm7esnuj7XhmLDdPta8NlLL9o0yz1x9kWA%2Be9EvQebBY%2BhPdSOAkpdaR5M8i7LNpYwnF1QKmX2e7eIl1zxkq3DcjQqaBcpGREQV3s3u8MwXgs0z5oADHuleswS%2FMQUjZFzvoIRMr57rW7RSFCY3beAT2twX%2FpxxzwDUCMjiyGHSKoi1FSlXO6ho7jibg2P%2FOsO2u7gzUev%2B0CE5KWUPYvlCXrT%2Bd30UvGrzhpwOavbrdZ5Cnk21nv1o6CIfE0ZBeSu7ko8X07HbMZ%2ByT9kewIecODZ9I%2Ft7Df5%2B4VdvrHrqBfTBvtO4MVee16JAorw%2FmolH7iVsgprBx0W1oiwEIwTVoZje1YrDPah%2FbOrqP9BpK3XKCPhaSDh3LBbrBDruK%2F1SGg0zMjzaRsR%2Bd80ZfeIrv71uxFDFaPQoMO%2BklqIGOrEBIXOcU5WqFpqOnHohJ6zsIdyW2cDKsUOjo%2BxSSRx%2FiycpoDlLhkBwgxFH7h2BC94mIgT5fufqg1OUYConhFOxIuFZ%2FGVBCn0eZWUTigGnHCc9XAetoMd8EWZ9NEK8lcUSFVVYqxlVwi4hU6%2BAf4TWxUyrYdcATxSyOXNSDY22dBaOMICi7DPZr3AwR0FkBzhF%2F0vnmv6Pq6452uYLSBB21ZNTkEm8VLVbhqlb4748z8eb&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230423T213731Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFBHDLLY5C%2F20230423%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=940ec22ede1387face7cc1ce6a7371b7dd49f055c61a7ebfc42a0561e7be6c2d",
            "width": 200,
            "height": 200
          },
          "REGULAR": {
            "url": "https://edamam-product-images.s3.amazonaws.com/web-img/270/270c9aae056587c1f176ae6eafdb4c0d.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQCJQIhC4qkNQMT%2BsfZBBM6imfSCbhc00qVjzyisP5jbTQIgXMqQdGGlAXZiff%2BGvNSrIr36AHleRUl%2BGIfUD8bwygEqwgUI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDM3sys8nakzofhDwXiqWBccYz0YciF5X1grIj6gaZZuBtpTjI9IkWAubjd7sTVJlYoexV87XA%2FB87TzPV%2FfI2zqHVQy2GpGfkVwL3Ly1qnOQ2BpRk4flwSjo0yHTDkksTs%2BXD8v2KCAUwqUxYGaM7sPQkQC32Q060ESB%2BOBIAhD1ssM%2F5b8mCPiFQw2bgGD5m6B5lFjvhrJESgb9QibQZL8I0zmfFxsz5c5f3G2mMzKoq6lEj5mdozARyAAAJ5G0Kilhlc4g%2F11N5dtj92wp1xPXsKriknz3XtezFsj%2F0v0Tq0ExabUWLJ8f1C8e%2B8c21ncWf5U1cAIfgBQ9PmOEdduFwfXIdZssJ%2FU%2FGb%2BHMP4QS0azQGD0yXjcSjunbuguH%2Bea0E3C2lFcbVgtG%2BgY7S9J5k7dCBtYgAYReml1QtxfSucUeSxSIp8giBjBj0JPr9kvpzxk6TggV%2BZCc3grqQuouJ%2FIm6AXrokvVxm7esnuj7XhmLDdPta8NlLL9o0yz1x9kWA%2Be9EvQebBY%2BhPdSOAkpdaR5M8i7LNpYwnF1QKmX2e7eIl1zxkq3DcjQqaBcpGREQV3s3u8MwXgs0z5oADHuleswS%2FMQUjZFzvoIRMr57rW7RSFCY3beAT2twX%2FpxxzwDUCMjiyGHSKoi1FSlXO6ho7jibg2P%2FOsO2u7gzUev%2B0CE5KWUPYvlCXrT%2Bd30UvGrzhpwOavbrdZ5Cnk21nv1o6CIfE0ZBeSu7ko8X07HbMZ%2ByT9kewIecODZ9I%2Ft7Df5%2B4VdvrHrqBfTBvtO4MVee16JAorw%2FmolH7iVsgprBx0W1oiwEIwTVoZje1YrDPah%2FbOrqP9BpK3XKCPhaSDh3LBbrBDruK%2F1SGg0zMjzaRsR%2Bd80ZfeIrv71uxFDFaPQoMO%2BklqIGOrEBIXOcU5WqFpqOnHohJ6zsIdyW2cDKsUOjo%2BxSSRx%2FiycpoDlLhkBwgxFH7h2BC94mIgT5fufqg1OUYConhFOxIuFZ%2FGVBCn0eZWUTigGnHCc9XAetoMd8EWZ9NEK8lcUSFVVYqxlVwi4hU6%2BAf4TWxUyrYdcATxSyOXNSDY22dBaOMICi7DPZr3AwR0FkBzhF%2F0vnmv6Pq6452uYLSBB21ZNTkEm8VLVbhqlb4748z8eb&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230423T213731Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFBHDLLY5C%2F20230423%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=fbef19acc8354ed816771b2e3782f822b4a260b675000953aeda26ccb30c8499",
            "width": 300,
            "height": 300
          },
          "LARGE": {
            "url": "https://edamam-product-images.s3.amazonaws.com/web-img/270/270c9aae056587c1f176ae6eafdb4c0d-l.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQCJQIhC4qkNQMT%2BsfZBBM6imfSCbhc00qVjzyisP5jbTQIgXMqQdGGlAXZiff%2BGvNSrIr36AHleRUl%2BGIfUD8bwygEqwgUI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDM3sys8nakzofhDwXiqWBccYz0YciF5X1grIj6gaZZuBtpTjI9IkWAubjd7sTVJlYoexV87XA%2FB87TzPV%2FfI2zqHVQy2GpGfkVwL3Ly1qnOQ2BpRk4flwSjo0yHTDkksTs%2BXD8v2KCAUwqUxYGaM7sPQkQC32Q060ESB%2BOBIAhD1ssM%2F5b8mCPiFQw2bgGD5m6B5lFjvhrJESgb9QibQZL8I0zmfFxsz5c5f3G2mMzKoq6lEj5mdozARyAAAJ5G0Kilhlc4g%2F11N5dtj92wp1xPXsKriknz3XtezFsj%2F0v0Tq0ExabUWLJ8f1C8e%2B8c21ncWf5U1cAIfgBQ9PmOEdduFwfXIdZssJ%2FU%2FGb%2BHMP4QS0azQGD0yXjcSjunbuguH%2Bea0E3C2lFcbVgtG%2BgY7S9J5k7dCBtYgAYReml1QtxfSucUeSxSIp8giBjBj0JPr9kvpzxk6TggV%2BZCc3grqQuouJ%2FIm6AXrokvVxm7esnuj7XhmLDdPta8NlLL9o0yz1x9kWA%2Be9EvQebBY%2BhPdSOAkpdaR5M8i7LNpYwnF1QKmX2e7eIl1zxkq3DcjQqaBcpGREQV3s3u8MwXgs0z5oADHuleswS%2FMQUjZFzvoIRMr57rW7RSFCY3beAT2twX%2FpxxzwDUCMjiyGHSKoi1FSlXO6ho7jibg2P%2FOsO2u7gzUev%2B0CE5KWUPYvlCXrT%2Bd30UvGrzhpwOavbrdZ5Cnk21nv1o6CIfE0ZBeSu7ko8X07HbMZ%2ByT9kewIecODZ9I%2Ft7Df5%2B4VdvrHrqBfTBvtO4MVee16JAorw%2FmolH7iVsgprBx0W1oiwEIwTVoZje1YrDPah%2FbOrqP9BpK3XKCPhaSDh3LBbrBDruK%2F1SGg0zMjzaRsR%2Bd80ZfeIrv71uxFDFaPQoMO%2BklqIGOrEBIXOcU5WqFpqOnHohJ6zsIdyW2cDKsUOjo%2BxSSRx%2FiycpoDlLhkBwgxFH7h2BC94mIgT5fufqg1OUYConhFOxIuFZ%2FGVBCn0eZWUTigGnHCc9XAetoMd8EWZ9NEK8lcUSFVVYqxlVwi4hU6%2BAf4TWxUyrYdcATxSyOXNSDY22dBaOMICi7DPZr3AwR0FkBzhF%2F0vnmv6Pq6452uYLSBB21ZNTkEm8VLVbhqlb4748z8eb&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230423T213731Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFBHDLLY5C%2F20230423%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=d4a2df8cac4fc198ac3598919ee4131df6800509102b54b6994e5e85c1e00155",
            "width": 600,
            "height": 600
          }
        },
        "source": "Ruhlman",
        "url": "http://ruhlman.com/2011/07/how-to-grill-corn/",
        "shareAs": "http://www.edamam.com/recipe/vanilla-ice-cream-with-grilled-corn-and-lime-845a9adf81bb22f3b76ead2981a872a0/-",
        "yield": 2,
        "dietLabels": [
          "Balanced",
          "Low-Sodium"
        ],
        "healthLabels": [
          "Vegetarian",
          "Pescatarian",
          "Gluten-Free",
          "Wheat-Free",
          "Egg-Free",
          "Peanut-Free",
          "Tree-Nut-Free",
          "Soy-Free",
          "Fish-Free",
          "Shellfish-Free",
          "Pork-Free",
          "Red-Meat-Free",
          "Crustacean-Free",
          "Celery-Free",
          "Mustard-Free",
          "Sesame-Free",
          "Lupine-Free",
          "Mollusk-Free",
          "Alcohol-Free",
          "Sulfite-Free",
          "Kosher"
        ],
        "cautions": [
          "Sulfites"
        ],
        "ingredientLines": [
          "Good vanilla ice cream (about 1/2 cup per person, or as you wish)",
          "Grilled corn (1/2 ear per person)",
          "1 lime (for every four servings)"
        ],
        "ingredients": [
          {
            "text": "Good vanilla ice cream (about 1/2 cup per person, or as you wish)",
            "quantity": 0.5,
            "measure": "cup",
            "food": "vanilla ice cream",
            "weight": 66,
            "foodCategory": "frozen treats",
            "foodId": "food_bsg87una16tr8waipd66na9drm1k",
            "image": "https://www.edamam.com/food-img/1be/1be43587dc55730fc761aedf4f3df090.jpg"
          },
          {
            "text": "Grilled corn (1/2 ear per person)",
            "quantity": 2,
            "measure": "ear",
            "food": "corn",
            "weight": 204,
            "foodCategory": "vegetables",
            "foodId": "food_b4wvre6b14mmkpaa22d8ybup8q51",
            "image": "https://www.edamam.com/food-img/eb5/eb5e11afb9f697720b2de2e0e0e27d8d.jpg"
          },
          {
            "text": "1 lime (for every four servings)",
            "quantity": 1,
            "measure": "<unit>",
            "food": "lime",
            "weight": 67,
            "foodCategory": "fruit",
            "foodId": "food_av58muyb8kg92fbk0g8g8aui5knv",
            "image": "https://www.edamam.com/food-img/48a/48a123c9576647c4ada6a41df5eeb22a.jpg"
          }
        ],
        "calories": 332.16,
        "totalWeight": 337,
        "totalTime": 0,
        "cuisineType": [
          "american"
        ],
        "mealType": [
          "lunch/dinner"
        ],
        "dishType": [
          "desserts"
        ],
        "totalNutrients": {
          "ENERC_KCAL": {
            "label": "Energy",
            "quantity": 332.16,
            "unit": "kcal"
          },
          "FAT": {
            "label": "Fat",
            "quantity": 10.148000000000001,
            "unit": "g"
          },
          "FASAT": {
            "label": "Saturated",
            "quantity": 5.15914,
            "unit": "g"
          },
          "FATRN": {
            "label": "Trans",
            "quantity": 0.014280000000000001,
            "unit": "g"
          },
          "FAMS": {
            "label": "Monounsaturated",
            "quantity": 2.85355,
            "unit": "g"
          },
          "FAPU": {
            "label": "Polyunsaturated",
            "quantity": 1.32865,
            "unit": "g"
          },
          "CHOCDF": {
            "label": "Carbs",
            "quantity": 60.785799999999995,
            "unit": "g"
          },
          "CHOCDF.net": {
            "label": "Carbohydrates (net)",
            "quantity": 54.367799999999995,
            "unit": "g"
          },
          "FIBTG": {
            "label": "Fiber",
            "quantity": 6.417999999999999,
            "unit": "g"
          },
          "SUGAR": {
            "label": "Sugars",
            "quantity": 27.9079,
            "unit": "g"
          },
          "SUGAR.added": {
            "label": "Sugars, added",
            "quantity": 14.0052,
            "unit": "g"
          },
          "PROCNT": {
            "label": "Protein",
            "quantity": 9.4498,
            "unit": "g"
          },
          "CHOLE": {
            "label": "Cholesterol",
            "quantity": 29.040000000000003,
            "unit": "mg"
          },
          "NA": {
            "label": "Sodium",
            "quantity": 84.74000000000001,
            "unit": "mg"
          },
          "CA": {
            "label": "Calcium",
            "quantity": 110.67,
            "unit": "mg"
          },
          "MG": {
            "label": "Magnesium",
            "quantity": 88.74,
            "unit": "mg"
          },
          "K": {
            "label": "Potassium",
            "quantity": 750.48,
            "unit": "mg"
          },
          "FE": {
            "label": "Iron",
            "quantity": 1.5221999999999998,
            "unit": "mg"
          },
          "ZN": {
            "label": "Zinc",
            "quantity": 1.4675,
            "unit": "mg"
          },
          "P": {
            "label": "Phosphorus",
            "quantity": 262.92,
            "unit": "mg"
          },
          "VITA_RAE": {
            "label": "Vitamin A",
            "quantity": 97.58000000000001,
            "unit": "µg"
          },
          "VITC": {
            "label": "Vitamin C",
            "quantity": 33.765,
            "unit": "mg"
          },
          "THIA": {
            "label": "Thiamin (B1)",
            "quantity": 0.36336,
            "unit": "mg"
          },
          "RIBF": {
            "label": "Riboflavin (B2)",
            "quantity": 0.28400000000000003,
            "unit": "mg"
          },
          "NIA": {
            "label": "Niacin (B3)",
            "quantity": 3.8213600000000003,
            "unit": "mg"
          },
          "VITB6A": {
            "label": "Vitamin B6",
            "quantity": 0.25021,
            "unit": "mg"
          },
          "FOLDFE": {
            "label": "Folate equivalent (total)",
            "quantity": 94.34,
            "unit": "µg"
          },
          "FOLFD": {
            "label": "Folate (food)",
            "quantity": 94.34,
            "unit": "µg"
          },
          "FOLAC": {
            "label": "Folic acid",
            "quantity": 0,
            "unit": "µg"
          },
          "VITB12": {
            "label": "Vitamin B12",
            "quantity": 0.2574,
            "unit": "µg"
          },
          "VITD": {
            "label": "Vitamin D",
            "quantity": 0.132,
            "unit": "µg"
          },
          "TOCPHA": {
            "label": "Vitamin E",
            "quantity": 0.48819999999999997,
            "unit": "mg"
          },
          "VITK1": {
            "label": "Vitamin K",
            "quantity": 1.2120000000000002,
            "unit": "µg"
          },
          "Sugar.alcohol": {
            "label": "Sugar alcohol",
            "quantity": 0,
            "unit": "g"
          },
          "WATER": {
            "label": "Water",
            "quantity": 254.5362,
            "unit": "g"
          }
        },
        "totalDaily": {
          "ENERC_KCAL": {
            "label": "Energy",
            "quantity": 16.608,
            "unit": "%"
          },
          "FAT": {
            "label": "Fat",
            "quantity": 15.612307692307695,
            "unit": "%"
          },
          "FASAT": {
            "label": "Saturated",
            "quantity": 25.7957,
            "unit": "%"
          },
          "CHOCDF": {
            "label": "Carbs",
            "quantity": 20.26193333333333,
            "unit": "%"
          },
          "FIBTG": {
            "label": "Fiber",
            "quantity": 25.671999999999997,
            "unit": "%"
          },
          "PROCNT": {
            "label": "Protein",
            "quantity": 18.8996,
            "unit": "%"
          },
          "CHOLE": {
            "label": "Cholesterol",
            "quantity": 9.680000000000001,
            "unit": "%"
          },
          "NA": {
            "label": "Sodium",
            "quantity": 3.5308333333333333,
            "unit": "%"
          },
          "CA": {
            "label": "Calcium",
            "quantity": 11.067,
            "unit": "%"
          },
          "MG": {
            "label": "Magnesium",
            "quantity": 21.12857142857143,
            "unit": "%"
          },
          "K": {
            "label": "Potassium",
            "quantity": 15.967659574468085,
            "unit": "%"
          },
          "FE": {
            "label": "Iron",
            "quantity": 8.456666666666665,
            "unit": "%"
          },
          "ZN": {
            "label": "Zinc",
            "quantity": 13.340909090909092,
            "unit": "%"
          },
          "P": {
            "label": "Phosphorus",
            "quantity": 37.56,
            "unit": "%"
          },
          "VITA_RAE": {
            "label": "Vitamin A",
            "quantity": 10.842222222222224,
            "unit": "%"
          },
          "VITC": {
            "label": "Vitamin C",
            "quantity": 37.516666666666666,
            "unit": "%"
          },
          "THIA": {
            "label": "Thiamin (B1)",
            "quantity": 30.28,
            "unit": "%"
          },
          "RIBF": {
            "label": "Riboflavin (B2)",
            "quantity": 21.846153846153847,
            "unit": "%"
          },
          "NIA": {
            "label": "Niacin (B3)",
            "quantity": 23.8835,
            "unit": "%"
          },
          "VITB6A": {
            "label": "Vitamin B6",
            "quantity": 19.246923076923075,
            "unit": "%"
          },
          "FOLDFE": {
            "label": "Folate equivalent (total)",
            "quantity": 23.585,
            "unit": "%"
          },
          "VITB12": {
            "label": "Vitamin B12",
            "quantity": 10.725000000000001,
            "unit": "%"
          },
          "VITD": {
            "label": "Vitamin D",
            "quantity": 0.8800000000000001,
            "unit": "%"
          },
          "TOCPHA": {
            "label": "Vitamin E",
            "quantity": 3.254666666666666,
            "unit": "%"
          },
          "VITK1": {
            "label": "Vitamin K",
            "quantity": 1.0100000000000002,
            "unit": "%"
          }
        },
        "digest": [
          {
            "label": "Fat",
            "tag": "FAT",
            "schemaOrgTag": "fatContent",
            "total": 10.148000000000001,
            "hasRDI": true,
            "daily": 15.612307692307695,
            "unit": "g",
            "sub": [
              {
                "label": "Saturated",
                "tag": "FASAT",
                "schemaOrgTag": "saturatedFatContent",
                "total": 5.15914,
                "hasRDI": true,
                "daily": 25.7957,
                "unit": "g"
              },
              {
                "label": "Trans",
                "tag": "FATRN",
                "schemaOrgTag": "transFatContent",
                "total": 0.014280000000000001,
                "hasRDI": false,
                "daily": 0,
                "unit": "g"
              },
              {
                "label": "Monounsaturated",
                "tag": "FAMS",
                "schemaOrgTag": null,
                "total": 2.85355,
                "hasRDI": false,
                "daily": 0,
                "unit": "g"
              },
              {
                "label": "Polyunsaturated",
                "tag": "FAPU",
                "schemaOrgTag": null,
                "total": 1.32865,
                "hasRDI": false,
                "daily": 0,
                "unit": "g"
              }
            ]
          },
          {
            "label": "Carbs",
            "tag": "CHOCDF",
            "schemaOrgTag": "carbohydrateContent",
            "total": 60.785799999999995,
            "hasRDI": true,
            "daily": 20.26193333333333,
            "unit": "g",
            "sub": [
              {
                "label": "Carbs (net)",
                "tag": "CHOCDF.net",
                "schemaOrgTag": null,
                "total": 54.367799999999995,
                "hasRDI": false,
                "daily": 0,
                "unit": "g"
              },
              {
                "label": "Fiber",
                "tag": "FIBTG",
                "schemaOrgTag": "fiberContent",
                "total": 6.417999999999999,
                "hasRDI": true,
                "daily": 25.671999999999997,
                "unit": "g"
              },
              {
                "label": "Sugars",
                "tag": "SUGAR",
                "schemaOrgTag": "sugarContent",
                "total": 27.9079,
                "hasRDI": false,
                "daily": 0,
                "unit": "g"
              },
              {
                "label": "Sugars, added",
                "tag": "SUGAR.added",
                "schemaOrgTag": null,
                "total": 14.0052,
                "hasRDI": false,
                "daily": 0,
                "unit": "g"
              }
            ]
          },
          {
            "label": "Protein",
            "tag": "PROCNT",
            "schemaOrgTag": "proteinContent",
            "total": 9.4498,
            "hasRDI": true,
            "daily": 18.8996,
            "unit": "g"
          },
          {
            "label": "Cholesterol",
            "tag": "CHOLE",
            "schemaOrgTag": "cholesterolContent",
            "total": 29.040000000000003,
            "hasRDI": true,
            "daily": 9.680000000000001,
            "unit": "mg"
          },
          {
            "label": "Sodium",
            "tag": "NA",
            "schemaOrgTag": "sodiumContent",
            "total": 84.74000000000001,
            "hasRDI": true,
            "daily": 3.5308333333333333,
            "unit": "mg"
          },
          {
            "label": "Calcium",
            "tag": "CA",
            "schemaOrgTag": null,
            "total": 110.67,
            "hasRDI": true,
            "daily": 11.067,
            "unit": "mg"
          },
          {
            "label": "Magnesium",
            "tag": "MG",
            "schemaOrgTag": null,
            "total": 88.74,
            "hasRDI": true,
            "daily": 21.12857142857143,
            "unit": "mg"
          },
          {
            "label": "Potassium",
            "tag": "K",
            "schemaOrgTag": null,
            "total": 750.48,
            "hasRDI": true,
            "daily": 15.967659574468085,
            "unit": "mg"
          },
          {
            "label": "Iron",
            "tag": "FE",
            "schemaOrgTag": null,
            "total": 1.5221999999999998,
            "hasRDI": true,
            "daily": 8.456666666666665,
            "unit": "mg"
          },
          {
            "label": "Zinc",
            "tag": "ZN",
            "schemaOrgTag": null,
            "total": 1.4675,
            "hasRDI": true,
            "daily": 13.340909090909092,
            "unit": "mg"
          },
          {
            "label": "Phosphorus",
            "tag": "P",
            "schemaOrgTag": null,
            "total": 262.92,
            "hasRDI": true,
            "daily": 37.56,
            "unit": "mg"
          },
          {
            "label": "Vitamin A",
            "tag": "VITA_RAE",
            "schemaOrgTag": null,
            "total": 97.58000000000001,
            "hasRDI": true,
            "daily": 10.842222222222224,
            "unit": "µg"
          },
          {
            "label": "Vitamin C",
            "tag": "VITC",
            "schemaOrgTag": null,
            "total": 33.765,
            "hasRDI": true,
            "daily": 37.516666666666666,
            "unit": "mg"
          },
          {
            "label": "Thiamin (B1)",
            "tag": "THIA",
            "schemaOrgTag": null,
            "total": 0.36336,
            "hasRDI": true,
            "daily": 30.28,
            "unit": "mg"
          },
          {
            "label": "Riboflavin (B2)",
            "tag": "RIBF",
            "schemaOrgTag": null,
            "total": 0.28400000000000003,
            "hasRDI": true,
            "daily": 21.846153846153847,
            "unit": "mg"
          },
          {
            "label": "Niacin (B3)",
            "tag": "NIA",
            "schemaOrgTag": null,
            "total": 3.8213600000000003,
            "hasRDI": true,
            "daily": 23.8835,
            "unit": "mg"
          },
          {
            "label": "Vitamin B6",
            "tag": "VITB6A",
            "schemaOrgTag": null,
            "total": 0.25021,
            "hasRDI": true,
            "daily": 19.246923076923075,
            "unit": "mg"
          },
          {
            "label": "Folate equivalent (total)",
            "tag": "FOLDFE",
            "schemaOrgTag": null,
            "total": 94.34,
            "hasRDI": true,
            "daily": 23.585,
            "unit": "µg"
          },
          {
            "label": "Folate (food)",
            "tag": "FOLFD",
            "schemaOrgTag": null,
            "total": 94.34,
            "hasRDI": false,
            "daily": 0,
            "unit": "µg"
          },
          {
            "label": "Folic acid",
            "tag": "FOLAC",
            "schemaOrgTag": null,
            "total": 0,
            "hasRDI": false,
            "daily": 0,
            "unit": "µg"
          },
          {
            "label": "Vitamin B12",
            "tag": "VITB12",
            "schemaOrgTag": null,
            "total": 0.2574,
            "hasRDI": true,
            "daily": 10.725000000000001,
            "unit": "µg"
          },
          {
            "label": "Vitamin D",
            "tag": "VITD",
            "schemaOrgTag": null,
            "total": 0.132,
            "hasRDI": true,
            "daily": 0.8800000000000001,
            "unit": "µg"
          },
          {
            "label": "Vitamin E",
            "tag": "TOCPHA",
            "schemaOrgTag": null,
            "total": 0.48819999999999997,
            "hasRDI": true,
            "daily": 3.254666666666666,
            "unit": "mg"
          },
          {
            "label": "Vitamin K",
            "tag": "VITK1",
            "schemaOrgTag": null,
            "total": 1.2120000000000002,
            "hasRDI": true,
            "daily": 1.0100000000000002,
            "unit": "µg"
          },
          {
            "label": "Sugar alcohols",
            "tag": "Sugar.alcohol",
            "schemaOrgTag": null,
            "total": 0,
            "hasRDI": false,
            "daily": 0,
            "unit": "g"
          },
          {
            "label": "Water",
            "tag": "WATER",
            "schemaOrgTag": null,
            "total": 254.5362,
            "hasRDI": false,
            "daily": 0,
            "unit": "g"
          }
        ]
      },
      "_links": {
        "self": {
          "title": "Self",
          "href": "https://api.edamam.com/api/recipes/v2/845a9adf81bb22f3b76ead2981a872a0?type=public&app_id=19c82497&app_key=f7ce5672f67e97572eed94fb0984eeda"
        }
      }
    }
  ]
}
''';
