load('DataMatrixLongV12Features_triclass.mat')
real12 = DataMatrixLongV(:,1) 
load('DataMatrixLongV5Features_triclass.mat')
real5 = DataMatrixLongV(:,1) 
load('DataMatrixLongV1Features_triclass.mat')
real1 = DataMatrixLongV(:,1) 

Triclass.Feature.Long(1).Label = real1+1
Triclass.Feature.Long(5).Label = real5+1
Triclass.Feature.Long(12).Label = real12+1
Triclass.Feature.Mean(5).Label = real5+1
Triclass.Feature.Mean(12).Label = real12+1

Triclass.Raw.Long(1).Label = real1+1
Triclass.Raw.Long(5).Label = real5+1
Triclass.Raw.Long(12).Label = real12+1
Triclass.Raw.Mean(5).Label = real5+1
Triclass.Raw.Mean(12).Label = real12+1

load('DataMatrixLongV12Features_recog.mat')
real12 = DataMatrixLongV(:,1) 
load('DataMatrixLongV5Features_recog.mat')
real5 = DataMatrixLongV(:,1) 
load('DataMatrixLongV1Features_recog.mat')
real1 = DataMatrixLongV(:,1) 

Recog.Feature.Long(1).Label = real1+1
Recog.Feature.Long(5).Label = real5+1
Recog.Feature.Long(12).Label = real12+1
Recog.Feature.Mean(5).Label = real5+1
Recog.Feature.Mean(12).Label = real12+1

Recog.Raw.Long(1).Label = real1+1
Recog.Raw.Long(5).Label = real5+1
Recog.Raw.Long(12).Label = real12+1
Recog.Raw.Mean(5).Label = real5+1
Recog.Raw.Mean(12).Label = real12+1