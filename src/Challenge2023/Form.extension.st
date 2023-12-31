Extension { #name : #Form }

{ #category : #'*Challenge2023' }
Form >> printAsPPM: stream [
	| scale |
	stream 
		<< 'P3'; crlf; 
		<< '# Auto generated by Pharo do not modify'; crlf;
		<< self width asString; crlf; << self height asString; crlf; << '255'; crlf.
	scale := NSScale linear
		range: { 0. 255 }.
	
	1 to: self width do: [ :x | 
		1 to: self height do: [ :y | | color triplet |
			color := self colorAt: x@y.
			triplet := color rgbTriplet collect: [ :float | (scale scale: float) asInteger asString ].
			stream << triplet first; space; << triplet second; space; << triplet third; crlf.
			] ].
	
]

{ #category : #'*Challenge2023' }
Form >> saveAsPPMFile [
	(Time millisecondClockValue asString, '.ppm') asFileReference writeStreamDo: [ :stream | 
		self printAsPPM: stream ]
]
