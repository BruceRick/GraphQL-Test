//  This file was automatically generated and should not be edited.

import Apollo

public struct LocationInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(slug: String) {
    graphQLMap = ["slug": slug]
  }

  public var slug: String {
    get {
      return graphQLMap["slug"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "slug")
    }
  }
}

public struct JobInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(companySlug: String, jobSlug: String) {
    graphQLMap = ["companySlug": companySlug, "jobSlug": jobSlug]
  }

  public var companySlug: String {
    get {
      return graphQLMap["companySlug"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "companySlug")
    }
  }

  public var jobSlug: String {
    get {
      return graphQLMap["jobSlug"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "jobSlug")
    }
  }
}

public final class CountriesQuery: GraphQLQuery {
  public let operationDefinition =
    "query Countries {\n  countries {\n    __typename\n    name\n    slug\n  }\n}"

  public let operationName = "Countries"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("countries", type: .nonNull(.list(.nonNull(.object(Country.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(countries: [Country]) {
      self.init(unsafeResultMap: ["__typename": "Query", "countries": countries.map { (value: Country) -> ResultMap in value.resultMap }])
    }

    public var countries: [Country] {
      get {
        return (resultMap["countries"] as! [ResultMap]).map { (value: ResultMap) -> Country in Country(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Country) -> ResultMap in value.resultMap }, forKey: "countries")
      }
    }

    public struct Country: GraphQLSelectionSet {
      public static let possibleTypes = ["Country"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("slug", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String, slug: String) {
        self.init(unsafeResultMap: ["__typename": "Country", "name": name, "slug": slug])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var slug: String {
        get {
          return resultMap["slug"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "slug")
        }
      }
    }
  }
}

public final class CountryQuery: GraphQLQuery {
  public let operationDefinition =
    "query Country($location: LocationInput!) {\n  country(input: $location) {\n    __typename\n    cities {\n      __typename\n      name\n      slug\n    }\n  }\n}"

  public let operationName = "Country"

  public var location: LocationInput

  public init(location: LocationInput) {
    self.location = location
  }

  public var variables: GraphQLMap? {
    return ["location": location]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("country", arguments: ["input": GraphQLVariable("location")], type: .nonNull(.object(Country.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(country: Country) {
      self.init(unsafeResultMap: ["__typename": "Query", "country": country.resultMap])
    }

    public var country: Country {
      get {
        return Country(unsafeResultMap: resultMap["country"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "country")
      }
    }

    public struct Country: GraphQLSelectionSet {
      public static let possibleTypes = ["Country"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("cities", type: .list(.nonNull(.object(City.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(cities: [City]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Country", "cities": cities.flatMap { (value: [City]) -> [ResultMap] in value.map { (value: City) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var cities: [City]? {
        get {
          return (resultMap["cities"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [City] in value.map { (value: ResultMap) -> City in City(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [City]) -> [ResultMap] in value.map { (value: City) -> ResultMap in value.resultMap } }, forKey: "cities")
        }
      }

      public struct City: GraphQLSelectionSet {
        public static let possibleTypes = ["City"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("slug", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String, slug: String) {
          self.init(unsafeResultMap: ["__typename": "City", "name": name, "slug": slug])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var slug: String {
          get {
            return resultMap["slug"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "slug")
          }
        }
      }
    }
  }
}

public final class JobsCountryQuery: GraphQLQuery {
  public let operationDefinition =
    "query JobsCountry($location: LocationInput!) {\n  country(input: $location) {\n    __typename\n    cities {\n      __typename\n      jobs {\n        __typename\n        ...JobSummary\n      }\n    }\n  }\n}"

  public let operationName = "JobsCountry"

  public var queryDocument: String { return operationDefinition.appending(JobSummary.fragmentDefinition) }

  public var location: LocationInput

  public init(location: LocationInput) {
    self.location = location
  }

  public var variables: GraphQLMap? {
    return ["location": location]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("country", arguments: ["input": GraphQLVariable("location")], type: .nonNull(.object(Country.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(country: Country) {
      self.init(unsafeResultMap: ["__typename": "Query", "country": country.resultMap])
    }

    public var country: Country {
      get {
        return Country(unsafeResultMap: resultMap["country"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "country")
      }
    }

    public struct Country: GraphQLSelectionSet {
      public static let possibleTypes = ["Country"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("cities", type: .list(.nonNull(.object(City.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(cities: [City]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Country", "cities": cities.flatMap { (value: [City]) -> [ResultMap] in value.map { (value: City) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var cities: [City]? {
        get {
          return (resultMap["cities"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [City] in value.map { (value: ResultMap) -> City in City(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [City]) -> [ResultMap] in value.map { (value: City) -> ResultMap in value.resultMap } }, forKey: "cities")
        }
      }

      public struct City: GraphQLSelectionSet {
        public static let possibleTypes = ["City"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("jobs", type: .list(.nonNull(.object(Job.selections)))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(jobs: [Job]? = nil) {
          self.init(unsafeResultMap: ["__typename": "City", "jobs": jobs.flatMap { (value: [Job]) -> [ResultMap] in value.map { (value: Job) -> ResultMap in value.resultMap } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var jobs: [Job]? {
          get {
            return (resultMap["jobs"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Job] in value.map { (value: ResultMap) -> Job in Job(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Job]) -> [ResultMap] in value.map { (value: Job) -> ResultMap in value.resultMap } }, forKey: "jobs")
          }
        }

        public struct Job: GraphQLSelectionSet {
          public static let possibleTypes = ["Job"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(JobSummary.self),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var jobSummary: JobSummary {
              get {
                return JobSummary(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }
    }
  }
}

public final class JobsCityQuery: GraphQLQuery {
  public let operationDefinition =
    "query JobsCity($location: LocationInput!) {\n  city(input: $location) {\n    __typename\n    jobs {\n      __typename\n      ...JobSummary\n    }\n  }\n}"

  public let operationName = "JobsCity"

  public var queryDocument: String { return operationDefinition.appending(JobSummary.fragmentDefinition) }

  public var location: LocationInput

  public init(location: LocationInput) {
    self.location = location
  }

  public var variables: GraphQLMap? {
    return ["location": location]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("city", arguments: ["input": GraphQLVariable("location")], type: .nonNull(.object(City.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(city: City) {
      self.init(unsafeResultMap: ["__typename": "Query", "city": city.resultMap])
    }

    public var city: City {
      get {
        return City(unsafeResultMap: resultMap["city"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "city")
      }
    }

    public struct City: GraphQLSelectionSet {
      public static let possibleTypes = ["City"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("jobs", type: .list(.nonNull(.object(Job.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(jobs: [Job]? = nil) {
        self.init(unsafeResultMap: ["__typename": "City", "jobs": jobs.flatMap { (value: [Job]) -> [ResultMap] in value.map { (value: Job) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var jobs: [Job]? {
        get {
          return (resultMap["jobs"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Job] in value.map { (value: ResultMap) -> Job in Job(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Job]) -> [ResultMap] in value.map { (value: Job) -> ResultMap in value.resultMap } }, forKey: "jobs")
        }
      }

      public struct Job: GraphQLSelectionSet {
        public static let possibleTypes = ["Job"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(JobSummary.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var jobSummary: JobSummary {
            get {
              return JobSummary(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class JobDetailsQuery: GraphQLQuery {
  public let operationDefinition =
    "query JobDetails($jobInput: JobInput!) {\n  job(input: $jobInput) {\n    __typename\n    ...JobDetails\n  }\n}"

  public let operationName = "JobDetails"

  public var queryDocument: String { return operationDefinition.appending(JobDetails.fragmentDefinition) }

  public var jobInput: JobInput

  public init(jobInput: JobInput) {
    self.jobInput = jobInput
  }

  public var variables: GraphQLMap? {
    return ["jobInput": jobInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("job", arguments: ["input": GraphQLVariable("jobInput")], type: .nonNull(.object(Job.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(job: Job) {
      self.init(unsafeResultMap: ["__typename": "Query", "job": job.resultMap])
    }

    public var job: Job {
      get {
        return Job(unsafeResultMap: resultMap["job"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "job")
      }
    }

    public struct Job: GraphQLSelectionSet {
      public static let possibleTypes = ["Job"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(JobDetails.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var jobDetails: JobDetails {
          get {
            return JobDetails(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public struct JobSummary: GraphQLFragment {
  public static let fragmentDefinition =
    "fragment JobSummary on Job {\n  __typename\n  title\n  slug\n  company {\n    __typename\n    name\n    slug\n    logoUrl\n  }\n  cities {\n    __typename\n    name\n  }\n}"

  public static let possibleTypes = ["Job"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("title", type: .nonNull(.scalar(String.self))),
    GraphQLField("slug", type: .nonNull(.scalar(String.self))),
    GraphQLField("company", type: .object(Company.selections)),
    GraphQLField("cities", type: .list(.nonNull(.object(City.selections)))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(title: String, slug: String, company: Company? = nil, cities: [City]? = nil) {
    self.init(unsafeResultMap: ["__typename": "Job", "title": title, "slug": slug, "company": company.flatMap { (value: Company) -> ResultMap in value.resultMap }, "cities": cities.flatMap { (value: [City]) -> [ResultMap] in value.map { (value: City) -> ResultMap in value.resultMap } }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var title: String {
    get {
      return resultMap["title"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "title")
    }
  }

  public var slug: String {
    get {
      return resultMap["slug"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "slug")
    }
  }

  public var company: Company? {
    get {
      return (resultMap["company"] as? ResultMap).flatMap { Company(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "company")
    }
  }

  public var cities: [City]? {
    get {
      return (resultMap["cities"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [City] in value.map { (value: ResultMap) -> City in City(unsafeResultMap: value) } }
    }
    set {
      resultMap.updateValue(newValue.flatMap { (value: [City]) -> [ResultMap] in value.map { (value: City) -> ResultMap in value.resultMap } }, forKey: "cities")
    }
  }

  public struct Company: GraphQLSelectionSet {
    public static let possibleTypes = ["Company"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("slug", type: .nonNull(.scalar(String.self))),
      GraphQLField("logoUrl", type: .scalar(String.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(name: String, slug: String, logoUrl: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Company", "name": name, "slug": slug, "logoUrl": logoUrl])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var name: String {
      get {
        return resultMap["name"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }

    public var slug: String {
      get {
        return resultMap["slug"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "slug")
      }
    }

    public var logoUrl: String? {
      get {
        return resultMap["logoUrl"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "logoUrl")
      }
    }
  }

  public struct City: GraphQLSelectionSet {
    public static let possibleTypes = ["City"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(name: String) {
      self.init(unsafeResultMap: ["__typename": "City", "name": name])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var name: String {
      get {
        return resultMap["name"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }
  }
}

public struct JobDetails: GraphQLFragment {
  public static let fragmentDefinition =
    "fragment JobDetails on Job {\n  __typename\n  commitment {\n    __typename\n    title\n  }\n  description\n  applyUrl\n}"

  public static let possibleTypes = ["Job"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("commitment", type: .nonNull(.object(Commitment.selections))),
    GraphQLField("description", type: .scalar(String.self)),
    GraphQLField("applyUrl", type: .scalar(String.self)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(commitment: Commitment, description: String? = nil, applyUrl: String? = nil) {
    self.init(unsafeResultMap: ["__typename": "Job", "commitment": commitment.resultMap, "description": description, "applyUrl": applyUrl])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var commitment: Commitment {
    get {
      return Commitment(unsafeResultMap: resultMap["commitment"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "commitment")
    }
  }

  public var description: String? {
    get {
      return resultMap["description"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "description")
    }
  }

  public var applyUrl: String? {
    get {
      return resultMap["applyUrl"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "applyUrl")
    }
  }

  public struct Commitment: GraphQLSelectionSet {
    public static let possibleTypes = ["Commitment"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("title", type: .nonNull(.scalar(String.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(title: String) {
      self.init(unsafeResultMap: ["__typename": "Commitment", "title": title])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var title: String {
      get {
        return resultMap["title"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "title")
      }
    }
  }
}
