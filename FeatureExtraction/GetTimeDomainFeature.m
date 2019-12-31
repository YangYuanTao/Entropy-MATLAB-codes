function SYPara=GetTimeDomainFeature(x)
%    GetTimeDomainFeature.m      ��������������źŵ�ʱ��ͳ������ֵ
%           x                    ����:Ҫ����ʱ�������������ź�(û��ʱ����)
%        SYPara                  ���������õ���ʱ��ͳ������������13��1����
%     SYPara(1,1)-��ֵ��Peak��; SYPara(2,1)-���ֵ��PPV��;SYPara(3,1)-��ֵ��MV��
%     SYPara(4,1)-ƽ����ֵ��MA��; SYPara(5,1)-������ֵ��SRA��;SYPara(6,1)-��׼�SD��
%     SYPara(7,1)-��Чֵ��RMS��; SYPara(8,1)-ƫ��ָ�꣨SKE��;SYPara(9,1)-�Ͷ�ָ��(KUR)
%     SYPara(10,1)-��ֵָ��(CRE); SYPara(11,1)-����ָ��(IMP);SYPara(12,1)-ԣ��ָ��(CLE)
%     SYPara(13,1)-����ָ��(BY)

if nargin~=1
    error('The Wrong Input');
end

%����������ͳ������ֵ����ֵ��Peak�������ֵ��PPV������ֵ��MV����
%ƽ����ֵ��MA����������ֵ��SRA������׼�SD������Чֵ��������ֵ����RMS��
Peak=max(abs(x));
PPV=max(x)-min(x);
MV=mean(x);
MA=mean(abs(x));
SRA=mean(sqrt(abs(x)))^2;
SD=std(x,1);
RMS=sqrt(mean(x.^2));

%����������ͳ������ֵ��ƫ��ָ�꣨SKE�����Ͷ�ָ��(KUR)����ֵָ��(CRE)������ָ��(IMP)��ԣ��ָ��(CLE)������ָ�꣨BY��
SKE=mean((x-MV).^3)/RMS^3;
KUR=mean((x-MV).^4)/RMS^4;
CRE=Peak/RMS;
IMP=Peak/MA;
CLE=Peak/SRA;
BY=RMS/MA;
    
SYPara=zeros(12,1);
SYPara(1,1)=Peak; SYPara(2,1)=PPV;SYPara(3,1)=MV;
SYPara(4,1)=MA; SYPara(5,1)=SRA;SYPara(6,1)=SD;
SYPara(7,1)=RMS; SYPara(8,1)=SKE;SYPara(9,1)=KUR;
SYPara(10,1)=CRE; SYPara(11,1)=IMP;SYPara(12,1)=CLE; 
SYPara(13,1)=BY; 
