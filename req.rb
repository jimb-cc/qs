require 'mongo'
require 'faker'


@DB = Mongo::Client.new(ARGV[1])
# set the logger level for the mongo driver
Mongo::Logger.logger.level = ::Logger::WARN
# The URI connects to the admin DB, so we need to change the DB to be what we want to use.
@DB = @DB.use("quote_store")


@xml =
    "<soapenv:Envelope xmlns:ns2=\"http://mongodb.com/schemas/webservice/car/quote/businessentity/1/0/\" xmlns:ns1=\"http://mongodb.com/schemas/webservice/common/quote/header/1/0/\" xmlns:ns=\"http://mongodb.com/schemas/webservice/common/header/external/1/0/\" xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\">
            <soapenv:Header>
            <ns:MongoISCommonHeaderExternal>
            <IPAddress>IPAddress3</IPAddress>
      <version>1.0</version>
            <date>2016-02-08</date>
      <time>12:00:00</time>
            <locale>en_GB</locale>
    </ns:MongoISCommonHeaderExternal>
            <ns1:commonQuoteHeader>
            <externalQuoteIdentifier>
            <quoteReference>USWIQUOTE25022016001</quoteReference>
      </externalQuoteIdentifier>
            </ns1:commonQuoteHeader>
  </soapenv:Header>
            <soapenv:Body>
            <ns2:getQuoteRequest>
            <pcwid>USWI</pcwid>
      <primaryDriver>
        <dateOfBirth>1981-08-01</dateOfBirth>
            <occupation>
            <occupationCode>462</occupationCode>
          <employerBusinessType>295</employerBusinessType>
            <employmentStatus>Employed</employmentStatus>
        </occupation>
            <gender>Male</gender>
        <maritalStatus>Married</maritalStatus>
            <name>
            <title>Mr</title>
          <forename>#####</forename>
            <surname>########</surname>
            </name>
        <conviction>
          <dateOfConviction>2010-01-01</dateOfConviction>
            <lengthOfBanInMonths>0</lengthOfBanInMonths>
          <convictionCode>XXXX</convictionCode>
            <points>0</points>
          <fineAmount>0</fineAmount>
            <testReading/>
            <testMethod/>
            </conviction>
        <licenceType>Full UK</licenceType>
            <mainDriver>true</mainDriver>
        <ukResidentFromBirth>false</ukResidentFromBirth>
            <ukResidentSince>08-1981</ukResidentSince>
        <claim>
          <claimList>
            <claimsEntry>
              <dateOfClaim>2015-12-15</dateOfClaim>
            <totalClaimCost>10</totalClaimCost>
              <describeClaimType>Something surprising goes here, in text</describeClaimType>
            <otherClaimDetails>
            <affectedNCD>false</affectedNCD>
              </otherClaimDetails>
            </claimsEntry>
          </claimList>
            </claim>
        <carsInHousehold>1</carsInHousehold>
            <anyNonMotorCriminalConvictions>false</anyNonMotorCriminalConvictions>
        <medicalConditionOrDisabilitiesDVLAReportable>No</medicalConditionOrDisabilitiesDVLAReportable>
            <licenceObtained>
            <day>01</day>
          <month>01</month>
            <year>2005</year>
        </licenceObtained>
            <otherOccupation>
            <isOtherOccupation>true</isOtherOccupation>
          <occupation>
            <occupationCode>C57</occupationCode>
            <employerBusinessType>036</employerBusinessType>
            <employmentStatus>Employed</employmentStatus>
            </occupation>
        </otherOccupation>
            <doYouSmoke>false</doYouSmoke>
        <insuranceDeclined>false</insuranceDeclined>
            <motoringOffencesOrConvictionLast5>false</motoringOffencesOrConvictionLast5>
        <accidentsClaimsOrLossesLast5>false</accidentsClaimsOrLossesLast5>
            <NCDEntitlement>
            <NCDEntitlement>0</NCDEntitlement>
        </NCDEntitlement>
            <ownHome>true</ownHome>
        <childrenU16>0</childrenU16>
            <paymentPreference>Annually</paymentPreference>
        <vehicleKeeper>Proposer</vehicleKeeper>
            <vehicleOwner>Proposer</vehicleOwner>
      </primaryDriver>
            <additionalDriver>
            <dateOfBirth>1983-02-01</dateOfBirth>
        <occupation>
          <occupationCode>B36</occupationCode>
            <employerBusinessType>199</employerBusinessType>
          <employmentStatus>Employed</employmentStatus>
            </occupation>
        <gender>Female</gender>
            <maritalStatus>Single</maritalStatus>
        <name>
          <title>Mrs</title>
            <forename>Someone</forename>
          <surname>Else</surname>
            </name>
        <conviction>
          <dateOfConviction>2015-11-09</dateOfConviction>
            <lengthOfBanInMonths>0</lengthOfBanInMonths>
          <convictionCode>CD16</convictionCode>
            <points>0</points>
          <fineAmount>0</fineAmount>
            <testReading/>
            <testMethod/>
            </conviction>
        <licenceType>Full UK</licenceType>
            <mainDriver>false</mainDriver>
        <ukResidentFromBirth>false</ukResidentFromBirth>
            <ukResidentSince>2010-07</ukResidentSince>
        <claim>
          <claimList>
            <claimsEntry>
              <dateOfClaim>2015-12-15</dateOfClaim>
            <totalClaimCost>10</totalClaimCost>
              <describeClaimType>More surprising details go here, also in text</describeClaimType>
            <otherClaimDetails>
            <affectedNCD>false</affectedNCD>
              </otherClaimDetails>
            </claimsEntry>
          </claimList>
            </claim>
        <carsInHousehold>1</carsInHousehold>
            <anyNonMotorCriminalConvictions>false</anyNonMotorCriminalConvictions>
        <medicalConditionOrDisabilitiesDVLAReportable>No</medicalConditionOrDisabilitiesDVLAReportable>
            <licenceObtained>
            <day>01</day>
          <month>01</month>
            <year>2005</year>
        </licenceObtained>
            <relationshipWithPH>Parent</relationshipWithPH>
        <otherOccupation>
          <isOtherOccupation>false</isOtherOccupation>
            </otherOccupation>
        <doYouSmoke>false</doYouSmoke>
            <insuranceDeclined>false</insuranceDeclined>
        <motoringOffencesOrConvictionLast5>false</motoringOffencesOrConvictionLast5>
            <accidentsClaimsOrLossesLast5>false</accidentsClaimsOrLossesLast5>
      </additionalDriver>
            <contactDetails>
            <emailAddress>email@theinternet.com</emailAddress>
        <telephoneNumber>0234567890</telephoneNumber>
            <whereDidYouHear/>
            </contactDetails>
      <carDetails>
        <vehicleRegistrationMark>XX5 XX6</vehicleRegistrationMark>
            <yearOfManufacture>1998</yearOfManufacture>
        <annualMileage>5000</annualMileage>
            <businessMileage>0</businessMileage>
        <estimatedValue>145</estimatedValue>
            <trackerCode>
            <typeOfTracker>Eye Track GSM GPS</typeOfTracker>
          <fittedBy/>
            </trackerCode>
        <immobiliser>Thatcham 2 fitted</immobiliser>
            <transmissionType>MANUAL</transmissionType>
        <fuelType>PETROL</fuelType>
            <engineSize>1124</engineSize>
        <noOfDoors>0</noOfDoors>
            <drivingTypeLeftOrRight>Right</drivingTypeLeftOrRight>
        <noOfSeatsInCar>4</noOfSeatsInCar>
            <regUseInPeakTime>1</regUseInPeakTime>
        <alarmCode>None</alarmCode>
            <ABICode>3000000001</ABICode>
        <imported>false</imported>
            <modifications/>
            <carKeptLocation>
            <dayParkingLocation>At home</dayParkingLocation>
          <overnightParkingLocation>Garage</overnightParkingLocation>
            <overnightPostcode>
            <outerCode/>
            <innerCode/>
            </overnightPostcode>
        </carKeptLocation>
            <vehicleUsage>Social only (SDP)</vehicleUsage>
        <datePurchased>01-2013</datePurchased>
            <notYetPurch
  elapsed = Time.nowased>false</notYetPurchased>
        <vehicleMake>PEUGEOT</vehicleMake>
            <vehicleModel>106 XL</vehicleModel>
        <trim/>
            <characteristicsExtensions>
            <additionalInfo name=\"Do you drive any other cars?\">No</additionalInfo>
        </characteristicsExtensions>
            </carDetails>
      <cover>
        <startDate>2016-02-16</startDate>
            <voluntaryExcess>150</voluntaryExcess>
        <coverType>Comprehensive</coverType>
            <protectedNCD>false</protectedNCD>
      </cover>
            <policyHolder>
            <dateOfBirth>1981-08-01</dateOfBirth>
        <gender>Male</gender>
            <maritalStatus>Married</maritalStatus>
        <name>
          <title>Mr</title>
            <forename>myName</forename>
          <surname>mySurname</surname>
            </name>
        <primaryAddress>
          <addressLine1>myStreetRoad</addressLine1>
            <addressLine2>myTown</addressLine2>
          <addressLine3/>
            <addressLine4>MyCity</addressLine4>
          <addressLine5/>
            <addressLine6/>
            <addressLine7/>
            <addressLine8/>
            <addressLine9/>
            <postcode>
            <outerCode>AB12</outerCode>
            <innerCode>3DE</innerCode>
            </postcode>
        </primaryAddress>
            </policyHolder>
    </ns2:getQuoteRequest>
            </soapenv:Body>
</soapenv:Envelope>
"





def makedocs(numdocs)

  pcwid = ["USWI","CPTM","JIMS","MOES","MONG","MSMK","ANDY"]
  gender = ["male", "female", "male", "female", "male", "female", "male", "female", "male", "female", "male", "female", "male", "female", "male", "female", "male", "female", "male", "female", "male", "female", "unspecifed"]
  married = ["married", "single"]

  @docs = Array.new

  for i in 1..numdocs

    qr = "USWIQUOTE"+(250000000000+rand(100000000)).to_s
    quoterequest =
        {
            :version => 1.0,
            :time => Time.now,
            :local => 'en_GB',
            :quoteReference => qr,
            :pcwid => pcwid[rand(pcwid.size)],
            :primaryDriver => {
                :DOB => "1981-01-01",
                :occupationCode => "462",
                :employmentStatus => "Employed",
                :gender => gender[rand(gender.size)],
                :maritalStatus => married[rand(married.size)],
                :title => Faker::Name.prefix,
                :forename => Faker::Name.first_name,
                :surname => Faker::Name.last_name
            },
            :additonalDrivers => [
                {
                    :DOB => "1981-01-01",
                    :occupationCode => "462",
                    :employmentStatus => "Employed",
                    :gender => gender[rand(gender.size)],
                    :maritalStatus => married[rand(married.size)],
                    :title => Faker::Name.prefix,
                    :forename => Faker::Name.first_name,
                    :surname => Faker::Name.last_name
                },
            ],
            :originalXML => @xml
        }

    @docs << quoterequest

  end
end



def insertdocs(coll)
  result = @DB[coll].insert_many(@docs)
end


makenow = Time.now
makedocs(1000)
puts "Documents created in #{Time.now - makenow}"

#
totalInsertnow = Time.now
for i in 1..ARGV[0].to_i
  insertnow = Time.now
  insertdocs("requests")
  puts "Documents inserted in #{Time.now - insertnow} count = #{i*1000}"
end
puts "ALL Documents inserted in #{Time.now - totalInsertnow}"