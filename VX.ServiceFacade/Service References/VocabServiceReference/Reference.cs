﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.261
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace VX.ServiceFacade.VocabServiceReference {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="VocabServiceReference.IVocabExtService")]
    public interface IVocabExtService {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IVocabExtService/GetTask", ReplyAction="http://tempuri.org/IVocabExtService/GetTaskResponse")]
        [System.ServiceModel.ServiceKnownTypeAttribute(typeof(VX.Domain.DataContracts.TaskContract))]
        [System.ServiceModel.ServiceKnownTypeAttribute(typeof(VX.Domain.DataContracts.WordContract[]))]
        [System.ServiceModel.ServiceKnownTypeAttribute(typeof(VX.Domain.DataContracts.WordContract))]
        [System.ServiceModel.ServiceKnownTypeAttribute(typeof(VX.Domain.DataContracts.LanguageContract))]
        [System.ServiceModel.ServiceKnownTypeAttribute(typeof(object[]))]
        object GetTask();
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IVocabExtServiceChannel : VX.ServiceFacade.VocabServiceReference.IVocabExtService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class VocabExtServiceClient : System.ServiceModel.ClientBase<VX.ServiceFacade.VocabServiceReference.IVocabExtService>, VX.ServiceFacade.VocabServiceReference.IVocabExtService {
        
        public VocabExtServiceClient() {
        }
        
        public VocabExtServiceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public VocabExtServiceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public VocabExtServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public VocabExtServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public object GetTask() {
            return base.Channel.GetTask();
        }
    }
}
